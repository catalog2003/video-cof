import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart'; // Import VideoSDK if needed
import '../components/participant_tile.dart'; // Import ParticipantTile

class RoomScreen extends StatefulWidget {
  final String meetingId;
  final String displayName;

  const RoomScreen({
    Key? key,
    required this.meetingId,
    required this.displayName,
  }) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late Room _room;
  Map<String, Participant> participants = {};
  String? joined;

  @override
  void initState() {
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI1ZTg2NWMyMi01MzFkLTQyNzgtOTlkNy00NGEyNWYzYjg2YjUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxOTY2NTg5NywiZXhwIjoxNzIyMjU3ODk3fQ.vpBa7qNN1aX2MfCXWdaqbXFl9gPo_ftXg2Y6bpU-sbc",
      displayName: widget.displayName,
      micEnabled: true,
      camEnabled: true,
      defaultCameraIndex: 1,
    );

    setRoomEventListener();
    super.initState();
  }

  void setRoomEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        joined = "JOINED";
        participants[_room.localParticipant.id] = _room.localParticipant;
      });
    });

    _room.on(Events.participantJoined, (Participant participant) {
      setState(() => participants[participant.id] = participant);
    });

    _room.on(Events.participantLeft, (String participantId) {
      setState(() => participants.remove(participantId));
    });

    _room.on(Events.roomLeft, () {
      participants.clear();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  Future<bool> _onWillPop() async {
    _room.leave();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Video Conference'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: joined != null
              ? joined == "JOINED"
                  ? Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return ParticipantTile(
                                participant: participants.values.elementAt(index),
                              );
                            },
                            itemCount: participants.length,
                          ),
                        )
                      ],
                    )
                  : Text("JOINING the Room", style: TextStyle(color: Colors.white))
              : ElevatedButton(
                  onPressed: () {
                    _room.join();
                    setState(() {
                      joined = "JOINING";
                    });
                  },
                  child: Text("Join the Room"),
                ),
        ),
      ),
    );
  }
}

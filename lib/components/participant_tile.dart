import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart'; // Import VideoSDK if needed

class ParticipantTile extends StatefulWidget {
  final Participant participant;

  const ParticipantTile({
    Key? key,
    required this.participant,
  }) : super(key: key);

  @override
  State<ParticipantTile> createState() => _ParticipantTileState();
}

class _ParticipantTileState extends State<ParticipantTile> {
  Stream? videoStream;

  @override
  void initState() {
    widget.participant.streams.forEach((key, Stream stream) {
      if (stream.kind == 'video') {
        setState(() {
          videoStream = stream;
        });
      }
    });

    _initStreamListeners();
    super.initState();
  }

  void _initStreamListeners() {
    widget.participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => videoStream = stream);
      }
    });

    widget.participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => videoStream = null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: videoStream != null
          ? RTCVideoView(
              videoStream?.renderer as RTCVideoRenderer,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            )
          : Container(
              color: Colors.grey.shade800,
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}

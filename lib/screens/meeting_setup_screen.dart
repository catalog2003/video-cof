import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';
import './room_screen.dart';

 // Import VideoSDK if needed

class MeetingSetupScreen extends StatefulWidget {
  @override
  _MeetingSetupScreenState createState() => _MeetingSetupScreenState();
}

class _MeetingSetupScreenState extends State<MeetingSetupScreen> {
  TextEditingController _meetingIdController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Meeting Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _meetingIdController,
              decoration: InputDecoration(
                labelText: 'Meeting ID',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _displayNameController,
              decoration: InputDecoration(
                labelText: 'Display Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String meetingId = _meetingIdController.text.trim();
                String displayName = _displayNameController.text.trim();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomScreen(
                      meetingId: meetingId,
                      displayName: displayName,
                    ),
                  ),
                );
              },
              child: Text('Join Meeting'),
            ),
          ],
        ),
      ),
    );
  }
}

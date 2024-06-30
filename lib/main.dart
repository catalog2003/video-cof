import 'package:flutter/material.dart';
import 'screens/loading_screen.dart'; // Import LoadingScreen
import 'screens/meeting_setup_screen.dart'; // Import MeetingSetupScreen
import 'screens/room_screen.dart'; // Import RoomScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Conference App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(), // Initial screen to be displayed
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/setup': (context) => MeetingSetupScreen(),
        '/room': (context) => RoomScreen(
          meetingId: '', // default value, will be replaced during navigation
          displayName: '', // default value, will be replaced during navigation
        ),
      },
    );
  }
}

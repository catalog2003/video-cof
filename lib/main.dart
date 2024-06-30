import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/meeting_setup_screen.dart';
import 'screens/room_screen.dart';

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
      home: LoadingScreen(),
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/setup': (context) => MeetingSetupScreen(),
        '/room': (context) => RoomScreen(
          meetingId: '', // placeholder
          displayName: '', // placeholder
        ),
      },
    );
  }
}

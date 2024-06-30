# Video Conference App

A simple Flutter application for video conferencing using VideoSDK.

## Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your machine. Follow the installation guide here: [Flutter Installation](https://flutter.dev/docs/get-started/install)
- **VideoSDK Account**: Sign up for an account at VideoSDK and get your API token. Follow the setup guide here: [VideoSDK Getting Started](https://docs.videosdk.live/docs/realtime-video-api/getting-started)
- **Android/iOS Device or Emulator**: Set up your device or emulator for testing the application.

## Setup

1. **Clone the Repository**:
    ```bash
    git clone <repository-url>
    cd my_project
    ```

2. **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3. **Replace VideoSDK Token**:
    - Open `lib/screens/room_screen.dart`.
    - Replace the placeholder `"<YOUR_TOKEN_HERE>"` with your actual VideoSDK token.

    ```dart
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: "<YOUR_TOKEN_HERE>",
      displayName: widget.displayName,
      micEnabled: true,
      camEnabled: true,
      defaultCameraIndex: 1,
    );
    ```

## Running the App

### Android

1. **Connect an Android Device** or start an Android Emulator.
2. **Run the App**:
    ```bash
    flutter run
    ```

### iOS

1. **Connect an iOS Device** or start an iOS Simulator.
2. **Open the Project in Xcode**:
    ```bash
    open ios/Runner.xcworkspace
    ```
3. **Run the App**:
    ```bash
    flutter run
    ```


https://github.com/catalog2003/video-cof/assets/83747762/43fcee07-1ce8-46b8-82f3-37b4575f0185


## Testing the App

1. **Launch the App**: Start the application on your device or emulator.
2. **Enter Meeting Details**: Navigate to the `MeetingSetupScreen` and enter a valid meeting ID and your display name.
3. **Join the Meeting**: Press the 'Join Meeting' button to enter the video conference.
4. **Test Video Call**: Ensure that you can see and hear other participants, and they can see and hear you.

## Project Structure


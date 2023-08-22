import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'box.dart' deferred as box;

class SomeWidget extends StatefulWidget {
  const SomeWidget({super.key});
  static String routeName = "/some";

  @override
  State<SomeWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  late Future<void> _libraryFuture;

  @override
  void initState() {
    _libraryFuture = box.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<void>(
          future: _libraryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return box.VideoPlayerWidget(
                  VideoPlayerController.asset('assets/testVideo.mp4'), true, true);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

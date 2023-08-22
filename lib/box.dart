import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {

  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoPlayerWidget(
      this.videoPlayerController,
      this.looping,
      this.autoplay
      );

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(videoPlayerController: widget.videoPlayerController,
      aspectRatio: 4/9,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,

      errorBuilder: (context, errorMessage){
      return Center(
        child: Text("Something went wrong"),
      );
      }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
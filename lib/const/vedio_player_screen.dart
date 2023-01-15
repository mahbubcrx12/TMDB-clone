import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayTrailer extends StatefulWidget {
   PlayTrailer({Key? key, required this.trailerLink}) : super(key: key);
  String trailerLink;

  @override
  State<PlayTrailer> createState() => _PlayTrailerState();
}

class _PlayTrailerState extends State<PlayTrailer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  _playTrailer(){
     _videoPlayerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
     _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _playTrailer();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Center(
            child: Chewie(controller: _chewieController),
           ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }
}

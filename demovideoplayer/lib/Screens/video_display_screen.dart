
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';


class VideoPlayScreen extends StatefulWidget {
  final String videoUrl ;
  const VideoPlayScreen({super.key,required this.videoUrl});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

bool isloading = true;
  void initState() {


    initializeVideoPlayer();
    super.initState();
  }
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  void initializeVideoPlayer(){
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((value) => setState(() {
        isloading = false;
      }));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isloading? Center(child: CircularProgressIndicator(),):CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController
          ),

        ],
      ),
    );
  }
}

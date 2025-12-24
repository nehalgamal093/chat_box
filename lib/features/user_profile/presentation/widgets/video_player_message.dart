import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/video_controllers.dart';

class VideoPlayerMessage extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const VideoPlayerMessage({super.key,required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    var videoProvider = Provider.of<VideoControllers>(context);
    return Stack(
      children: [
        VideoPlayer(videoPlayerController),
        videoProvider.isPlaying? InkWell(onTap: (){
          videoProvider.pauseVideo();
          videoPlayerController.pause();
        },child: Icon(Icons.pause,color: ColorsManager.whiteColor,),):InkWell(onTap: (){
          videoProvider.playVideo();
          videoPlayerController.play();

        },child: Icon(Icons.play_arrow,color: ColorsManager.whiteColor,),)
      ],
    );
  }
}

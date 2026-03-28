import 'package:chat_box/core/common_widgets/full_video.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/video_controllers.dart';

class VideoPlayerMessage extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const VideoPlayerMessage({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FullVideo(videoPlayerController: videoPlayerController),
            ),
          );
        },
        child: VideoPlayer(videoPlayerController));
  }
}

import 'package:chat_box/features/user_profile/presentation/widgets/video_player_message.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../data/models/message.dart';

class MessageVideoBubble extends StatefulWidget {
  final Message message;
  const MessageVideoBubble({super.key,required this.message});

  @override
  State<MessageVideoBubble> createState() => _MessageVideoBubbleState();
}

class _MessageVideoBubbleState extends State<MessageVideoBubble> {
  late VideoPlayerController  videoController;
  @override
  void initState() {
    super.initState();
    print('🚸 ${widget.message.mediaUrl}');
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.message.mediaUrl!,
      ),
    )
      ..initialize().then((_) {
         setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 150,
          child:
          videoController.value.isInitialized
              ? AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: VideoPlayerMessage(videoPlayerController: videoController),
          )
              : Container(),
        ),
      ],
    );
  }
}

import 'package:chat_box/core/providers/set_volume.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../features/user_profile/presentation/provider/video_controllers.dart';
import '../resources/colors/colors_manager.dart';

class FullVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  const FullVideo({super.key, required this.videoPlayerController});

  @override
  State<FullVideo> createState() => _FullVideoState();
}

class _FullVideoState extends State<FullVideo> {
  @override
  void initState() {
    widget.videoPlayerController.addListener(() {
      if (!mounted) return;
      var drag = context.read<VideoControllers>().drag;
      if (drag) return;
      if (mounted) {
        double position = widget
            .videoPlayerController.value.position.inMilliseconds
            .toDouble();
        context.read<VideoControllers>().sliderPosition(position);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var videoProvider = Provider.of<VideoControllers>(context);
    var volumeProvider = Provider.of<SetVolumeProvider>(context);
    final position = videoProvider.position;
    final duration = widget.videoPlayerController.value.duration.inMilliseconds;

    double progress = duration == 0
        ? 0
        :  position / duration
           ;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AspectRatio(
            aspectRatio: 5/3,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: VideoPlayer(widget.videoPlayerController),
                ),
                Align(
                  alignment: Alignment.center,
                  child: videoProvider.isPlaying
                      ? InkWell(
                          onTap: () {
                            videoProvider.pauseVideo();
                            widget.videoPlayerController.pause();
                          },
                          child: Icon(
                            Icons.pause,
                            color: ColorsManager.whiteColor,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            videoProvider.playVideo();
                            widget.videoPlayerController.play();
                          },
                          child: Icon(
                            Icons.play_arrow,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.zoom_out_map,
                          color: Colors.white,
                        ),
                      ),
                      //videoPlayerController.value.position.inMilliseconds.toDouble()
                      SizedBox(
                        height: 35,
                        width: 300,
                        child: Slider(

                          value: progress,
                          // min: 0,
                          // max: widget.videoPlayerController.value.duration
                          //     .inMilliseconds
                          //     .toDouble(),
                          onChangeStart: (_) {
                            context.read<VideoControllers>().setDragging(true);
                          },
                          onChanged: (val) {
                            context
                                .read<VideoControllers>()
                                .sliderPosition(val);
                            widget.videoPlayerController.seekTo(
                                Duration(milliseconds: (val * duration).toInt()));
                          },
                          onChangeEnd: (val) {
                            context.read<VideoControllers>().setDragging(false);


                          },
                        ),
                      ),

                      volumeProvider.volumeOn
                          ? IconButton(
                              onPressed: () {
                                widget.videoPlayerController.setVolume(0);
                                volumeProvider.turnVolume();
                              },
                              icon: Icon(Icons.volume_down_rounded,
                                  color: Colors.white))
                          : IconButton(
                              onPressed: () {
                                volumeProvider.turnVolume();
                                widget.videoPlayerController.setVolume(100);
                              },
                              icon:
                                  Icon(Icons.volume_mute, color: Colors.white))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class MessageImageBubble extends StatefulWidget {
  final bool isSender;
  final String message;
  final String image;
  final String time;
  const MessageImageBubble({
    super.key,
    required this.isSender,
    required this.message,
    required this.image,
    required this.time,
  });

  @override
  State<MessageImageBubble> createState() => _MessageImageBubbleState();
}

class _MessageImageBubbleState extends State<MessageImageBubble>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                widget.isSender ? ColorsManager.cyan : ColorsManager.chatColor,
            borderRadius: BorderRadius.only(
              topRight:
                  widget.isSender ? Radius.circular(0) : Radius.circular(15),
              topLeft:
                  widget.isSender ? Radius.circular(15) : Radius.circular(0),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.image.isNotEmpty
                  ? textImage(
                    widget.message.isNotEmpty ? widget.message : "",
                    widget.image,
                    context,
                  )
                  : Text(
                    widget.message,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                  ),
              SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    widget.time.substring(11, 16),
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      color:
                          widget.isSender
                              ? ColorsManager.whiteColor
                              : ColorsManager.grey,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textImage(String text, String image, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
      SizedBox(height: 10),
      SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .3,
        child: Image.network(image, fit: BoxFit.cover),
      ),
    ],
  );
}

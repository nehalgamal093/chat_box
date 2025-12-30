import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../provider/show_scroll_button.dart';

class LoadMoreButton extends StatelessWidget {
  final ScrollController scrollController;
  const LoadMoreButton({super.key,required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowScrollButton>(
      builder: (context, provider, child) {
        return provider.isVisible
            ? Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: FloatingActionButton(
            backgroundColor: ColorsManager.darkBlue,
            onPressed: () {
              if (scrollController.hasClients) {
                scrollController.jumpTo(
                  scrollController.position.minScrollExtent,
                );
              }
            },
            child: Icon(
              Icons.arrow_downward_sharp,
              color: ColorsManager.medGrey,
            ),
          ),
        )
            : SizedBox.shrink();
      },
    );
  }
}

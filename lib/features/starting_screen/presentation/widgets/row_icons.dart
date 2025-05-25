import 'package:flutter/material.dart';

import '../../../../core/resources/common_widgets/custom_icon.dart';
import '../../../../core/resources/images/images_manager.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcon(image: ImagesManager.facebook),
        CustomIcon(image: ImagesManager.google),
        CustomIcon(image: ImagesManager.apple),
      ],
    );
  }
}

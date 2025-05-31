import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/colors/colors_manager.dart';
import '../provider/file_picker_provider.dart';

class FileBox extends StatelessWidget {
  const FileBox({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FilePickerProvider>(context);
    return provider.file.path.isNotEmpty
        ? Container(
          padding: const EdgeInsets.all(2),
          height: 40,
          decoration: BoxDecoration(color: ColorsManager.chatColor),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  provider.file.path,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    provider.clear();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        )
        : SizedBox();
  }
}

import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/features/user_profile/presentation/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../search/data/models/search_result.dart';

class SearchedUserItem extends StatelessWidget {
  final DataList dataList;
  const SearchedUserItem({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(id: dataList.id!),
          ),
        );
      },
      child: Row(
        children: [
          CirclePicture(imageUrl: dataList.profilePicture!, radius: 40),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dataList.fullName!),
              SizedBox(height: 5),
              Text(
                dataList.bio!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

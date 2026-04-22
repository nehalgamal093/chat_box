import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/common_widgets/custom_image.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/friends_requests/data/models/friend_requests.dart';
import 'package:chat_box/features/friends_requests/presentation/bloc/friend_requests_bloc/friend_requests_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendRequestItem extends StatelessWidget {
  final DataList dataList;
  final String status;
  const FriendRequestItem({
    super.key,
    required this.dataList,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        width: size.width*.8,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.medGrey),
          borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [
            // CirclePicture(imageUrl: dataList.profilePicture!,radius: 40,userId: dataList.id!,),
            CustomImage(profilePicture:dataList.profilePicture??""),
            SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dataList.fullName!,style: Theme.of(context).textTheme.bodyLarge,),
                Text("@laila",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorsManager.medGrey),),
                SizedBox(height: 5),
                Text("This my new account",style: Theme.of(context).textTheme.bodyMedium,),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<FriendRequestsBloc>().add(
                          AcceptRequestEvent(dataList.id!),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor:
                            status == StringsManager.accepted
                                ? ColorsManager.greenColor
                                : ColorsManager.lightBlue,
                      ),
                      child: Text(
                        StringsManager.accept,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FriendRequestsBloc>().add(
                          DeclineRequestEvent(dataList.id!),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: ColorsManager.redColor,
                      ),
                      child: Text(
                        StringsManager.decline,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

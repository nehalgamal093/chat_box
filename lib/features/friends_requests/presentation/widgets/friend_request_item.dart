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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(StringsManager.female, width: 100),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dataList.fullName!),
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
                      backgroundColor:
                          status == "accepted"
                              ? ColorsManager.greenColor
                              : ColorsManager.darkBlue,
                    ),
                    child: Text(
                      'Accept',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FriendRequestsBloc>().add(
                        DeclineRequestEvent(dataList.id!),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.redColor,
                    ),
                    child: Text(
                      'Decline',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

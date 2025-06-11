import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:chat_box/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:chat_box/features/search/presentation/widgets/searched_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SearchBloc, SearchState>(
            builder: (context,state) {
              return SearchField(textEditingController: textEditingController,onChanged: (val){
                if (val != null || val.isNotEmpty) {
                  var bloc = BlocProvider.of<SearchBloc>(context);
                  bloc.add(SearchTextEvent(val));
                }
              },);
            }
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchRequestState == SearchRequestState.loading) {
                return LoadingList();
              } else if (state.searchRequestState == SearchRequestState.success) {
                var searchedUsers = state.users ?? [];
                return ListView.separated(
                  itemCount: searchedUsers.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return SearchedUserItem(dataList: searchedUsers[index]);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

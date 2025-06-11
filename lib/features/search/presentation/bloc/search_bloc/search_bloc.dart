import 'package:bloc/bloc.dart';
import 'package:chat_box/features/search/data/models/search_result.dart';
import 'package:chat_box/features/search/domain/use_cases/search_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/logic/debounce.dart';
import '../../../../../core/network/AppFailures/app_failures.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  String keyword = "";
  SearchUseCase searchUseCase;
  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    Debounce debounce = Debounce(delay: const Duration(milliseconds: 500));
    on<SearchTextEvent>((event, emit) async {
      keyword = event.keyword;
      if(keyword.isNotEmpty){
        debounce.call(() {
          add(SearchUserEvent());
        });
      }
    });
    on<SearchUserEvent>((event, emit) async {
      emit(state.copyWith(searchRequestState: SearchRequestState.loading));
      var result = await searchUseCase.call(keyword);
      result.fold(
        (error) {
          emit(
            state.copyWith(
              searchRequestState: SearchRequestState.error,
              failures: error,
            ),
          );
        },
        (model) {
          List<DataList> list = [];
          if (keyword.isNotEmpty && keyword != null) {
            list.addAll(model.dataListList!);
          } else {
            list.clear();
          }
          emit(
            state.copyWith(
              searchRequestState: SearchRequestState.success,
              users: list,
            ),
          );
        },
      );
    });
  }
}

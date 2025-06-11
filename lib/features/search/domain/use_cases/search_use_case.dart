import 'package:chat_box/features/search/data/models/search_result.dart';
import 'package:chat_box/features/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

@injectable
class SearchUseCase {
  SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);

  Future<Either<AppFailures, SearchResult>> call(String keyword) =>
      searchRepo.search(keyword);
}

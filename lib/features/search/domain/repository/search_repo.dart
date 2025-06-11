import 'package:chat_box/features/search/data/models/search_result.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

abstract class SearchRepo{
  Future<Either<AppFailures,SearchResult>> search(String keyword);
}
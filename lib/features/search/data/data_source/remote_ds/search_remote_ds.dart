import '../../models/search_result.dart';

abstract class SearchRemoteDs {
  Future<SearchResult> search(String keyword);
}

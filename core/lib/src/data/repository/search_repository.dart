import '../../../core.dart';

abstract class SearchRepository {
  Future<List<MovieEntity>> search(String value);
}

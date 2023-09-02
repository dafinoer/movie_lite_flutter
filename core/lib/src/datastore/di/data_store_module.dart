import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import '../_constanta_keys.dart';

@module
abstract class DataStoreModule {
  @Named(securityBox)
  @preResolve
  Future<Box<String>> openBoxApiToken() => Hive.openBox<String>(securityBox);

  @Named(moviesBox)
  @preResolve
  Future<Box<String>> openBoxMovies() => Hive.openBox(moviesBox);
}

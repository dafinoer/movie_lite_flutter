import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSetup)
class TixCloneFlutterSetup extends AppSetup {
  TixCloneFlutterSetup({
    required super.baseUrl,
    required super.imageUrlPath,
    required super.backdropPath,
  });

  @factoryMethod
  factory TixCloneFlutterSetup.prod() {
    return TixCloneFlutterSetup(
      baseUrl: 'https://api.themoviedb.org/3/',
      imageUrlPath: 'https://image.tmdb.org/t/p/w500/',
      backdropPath: 'https://image.tmdb.org/t/p/w780/',
    );
  }
}

import 'package:core/core.dart';
import 'package:tix_clone_flutter/app_configure.dart';

extension StringExtension on String {
  String toUrlPosterPath() {
    final urlImage = getIt.get<AppSetup>();
    return '${urlImage.imageUrlPath}$this';
  }

  String toUrlBackdropPath() {
    final urlImage = getIt.get<AppSetup>();
    return '${urlImage.backdropPath}$this';
  }
}

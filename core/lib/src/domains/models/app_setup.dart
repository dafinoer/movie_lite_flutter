import 'package:equatable/equatable.dart';

class AppSetup extends Equatable {
  final String baseUrl;
  final String imageUrlPath;
  final String backdropPath;

  AppSetup({
    required this.baseUrl,
    required this.imageUrlPath,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [
        baseUrl,
        imageUrlPath,
        backdropPath,
      ];
}

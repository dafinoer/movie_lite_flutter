import 'package:injectable/injectable.dart';

import '../../data/repository/private_repository.dart';

@injectable
class SaveTokenApiKey {
  final PrivateRepository privateRepository;

  SaveTokenApiKey(this.privateRepository);

  Future<void> saveToken(String token) {
    return privateRepository.onWriteApiToken(token);
  }
}

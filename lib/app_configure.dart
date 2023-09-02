import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_configure.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    includeMicroPackages: true,
    preferRelativeImports: true,
    externalPackageModulesAfter: [
      ExternalModule(CorePackageModule),
    ])
Future<void> appConfigure() => getIt.init();

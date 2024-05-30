import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get_it_service_locator.config.dart';

export 'register_module.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
}

void configureBaseDependencies() => getIt.initBaseScope();

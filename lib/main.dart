import 'package:era_flutter/presentation/application/application.dart';
import 'package:era_flutter/presentation/application/get_it/get_it_service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  configureBaseDependencies();

  runApp(const ForestVPNTestApp());
}

import 'package:era_flutter/injectable.dart';
import 'package:era_flutter/presentation/application/application.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const ForestVPNTestApp());
}

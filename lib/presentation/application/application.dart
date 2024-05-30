import 'package:era_flutter/presentation/application/get_it/get_it_service_locator.dart';
import 'package:era_flutter/presentation/router/auto_router.dart';
import 'package:flutter/material.dart';

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Era Test',
      theme: ThemeData(fontFamily: 'SFProText'),
      routerConfig: getIt.get<AppRouter>().config(),
      builder: (BuildContext context, Widget? child) => child ?? const SizedBox(),
    );
  }
}

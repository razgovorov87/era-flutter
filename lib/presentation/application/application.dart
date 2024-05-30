import 'package:era_flutter/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      theme: ThemeData(fontFamily: 'SFProText'),
      home: const HomeScreen(),
    );
  }
}

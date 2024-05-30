// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

sealed class GetItKeys {
  static const String appDocumnetsDirectory = 'appDocumentsDirectory';
}

@module
abstract class RegisterModule {
  @preResolve
  @Named(GetItKeys.appDocumnetsDirectory)
  Future<Directory> get appDocumnetsDirectory => getApplicationDocumentsDirectory();
}

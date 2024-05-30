import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  Size getSize() => MediaQuery.sizeOf(this);
}

import 'package:flutter/material.dart';

// extension MediaQueryValue on BuildContext {
//   double get hight => MediaQuery.of(this).size.height;
//   double get width => MediaQuery.of(this).size.width;
//   double get toPadding => MediaQuery.of(this).viewPadding.top;
//   double get bottom => MediaQuery.of(this).viewInsets.bottom;
// }

class MediaQueryValue {
  MediaQueryValue({required this.context});
  final BuildContext context;
  double get hight => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

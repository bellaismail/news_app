import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.indent,
    required this.extend,
  }) : super(key: key);

  final double indent, extend;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      endIndent: extend,
      color: Colors.grey[300],
      thickness: 1.2,
    );
  }
}

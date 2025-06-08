import 'package:flutter/material.dart';

class AutoWrapText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AutoWrapText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      softWrap: true,
    );
  }
}

import 'package:flutter/material.dart';

class AutoResizeText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AutoResizeText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

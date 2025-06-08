import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextUtils {
   static Widget autoSize(
    String text, {
    double minFontSize = 12,
    double maxFontSize = 18,
    int maxLines = 1,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
  }) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
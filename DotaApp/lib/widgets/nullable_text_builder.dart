import 'package:flutter/material.dart';

typedef TextMaker = String Function(String x);

class NullableTextBuilder extends StatelessWidget {
  final String text;
  final TextMaker maker;
  final TextStyle style;
  final String nullText;

  NullableTextBuilder(this.text, this.maker, this.style, {this.nullText});

  @override
  Widget build(BuildContext context) => Text(
        text == null ? (nullText ?? '') : maker(text),
        style: style,
      );
}

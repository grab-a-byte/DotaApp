import 'dart:async';

import 'package:flutter/material.dart';

typedef InputFunction = void Function(String input);

class DebouncableTextbox extends StatefulWidget {
  final InputFunction _functionToDebounce;
  final int _numberOfMilliseconds;
  final IconData _icon;

  DebouncableTextbox(
      this._functionToDebounce, this._numberOfMilliseconds, this._icon);

  @override
  State<DebouncableTextbox> createState() => DebouncableTextboxState();
}

class DebouncableTextboxState extends State<DebouncableTextbox> {
  Timer? _timer;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_timer?.isActive ?? false) _timer!.cancel();
      _timer = Timer(Duration(milliseconds: widget._numberOfMilliseconds), () {
        widget._functionToDebounce(_controller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(prefixIcon: Icon(widget._icon)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

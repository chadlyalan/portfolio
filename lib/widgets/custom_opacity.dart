import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomOpacity extends ConsumerStatefulWidget {
  final String text;
  final int? delay;
  final TextStyle style;
  const CustomOpacity(
      {super.key, this.delay, required this.style, required this.text});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomOpacityState();
}

class _CustomOpacityState extends ConsumerState<CustomOpacity> {
  double opacity = 0;
  bool showAnimation = false;

  @override
  void initState() {
    if (widget.delay == null) {
      opacity = 1;
    } else {
      startAnimations();
    }
    super.initState();
  }

  startAnimations() {
    Timer(Duration(milliseconds: widget.delay!), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 1),
      child: Text(widget.text, style: widget.style),
    );
  }
}

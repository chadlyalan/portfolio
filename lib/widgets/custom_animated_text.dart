import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/main.dart';

class CustomAnimatedText extends ConsumerStatefulWidget {
  final String text;
  final TextStyle style;
  final ObjectKey? unique;
  final String cursor;
  final int? speed;
  final int? delay;
  const CustomAnimatedText(
      {super.key,
      required this.text,
      required this.style,
      this.unique,
      this.cursor = "|",
      this.speed,
      this.delay});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomAnimatedTextState();
}

class _CustomAnimatedTextState extends ConsumerState<CustomAnimatedText> {
  bool showAnimation = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.delay == null) {
      showAnimation = true;
    } else {
      startAnimations();
    }
  }

  startAnimations() {
    Timer(Duration(milliseconds: widget.delay!), () {
      setState(() {
        showAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeModeProvider);

    return showAnimation
        ? AnimatedTextKit(
            key: widget.unique ?? widget.key,
            animatedTexts: [
              TypewriterAnimatedText(widget.text,
                  textStyle: widget.style,
                  speed: Duration(milliseconds: widget.speed ?? 100),
                  cursor: widget.cursor),
            ],
            isRepeatingAnimation: false,
            totalRepeatCount: 0,
          )
        : Opacity(
            opacity: 0,
            child: Text(
              "Chad",
              style: widget.style,
            ),
          );
  }
}

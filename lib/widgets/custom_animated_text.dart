import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAnimatedText extends ConsumerWidget {
  String text;
  TextStyle style;
  CustomAnimatedText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(text,
            textStyle: style,
            speed: const Duration(milliseconds: 100),
            cursor: '|'),
      ],
      isRepeatingAnimation: false,
    );
  }
}

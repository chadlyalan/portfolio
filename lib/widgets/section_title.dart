import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionTitle extends ConsumerWidget {
  String text;
  SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTitle = TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.secondary,
    );

    return Text(text, style: colorTitle);
  }
}

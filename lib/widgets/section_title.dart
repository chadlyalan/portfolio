import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionTitle extends ConsumerWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTitle = TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.secondary,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: colorTitle),
    );
  }
}

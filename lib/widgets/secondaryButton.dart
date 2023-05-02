import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryButton extends ConsumerWidget {
  String text;
  final VoidCallback? callback;
  SecondaryButton({super.key, required this.text, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.secondary,
          side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
      child: Text(
        text,
      ),
    );
  }
}

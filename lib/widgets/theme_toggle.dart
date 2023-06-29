import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/main.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeProvider);

    return Switch(
      value: theme == ThemeMode.dark ? true : false,
      onChanged: (value) {
        ref.read(themeModeProvider.notifier).state =
            theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      },
    );
  }
}

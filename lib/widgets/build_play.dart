import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/basic_overlay_widget.dart';

class BuildPlay extends ConsumerWidget {
  const BuildPlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool = ref.watch(displayPlayController);
    return bool
        ? Container()
        : Container(
            alignment: Alignment.center,
            color: Colors.black26,
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 80));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/build_play.dart';
import 'package:video_player/video_player.dart';

final displayPlayController = StateProvider<bool>((ref) => false);

class BasicOverlayWidget extends ConsumerWidget {
  final VideoPlayerController controller;
  const BasicOverlayWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
          ref.read(displayPlayController.notifier).state = false;
        } else {
          controller.play();
          ref.read(displayPlayController.notifier).state = true;
        }
      },
      child: Stack(
        children: [
          const BuildPlay(),
          Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
        ],
      ),
    );
  }

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );
}

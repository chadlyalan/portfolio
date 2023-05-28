import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/basic_overlay_widget.dart';
import 'package:portfolio/widgets/secondaryButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends ConsumerWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return controller.value.isInitialized
        ? Column(
          children: [
           Padding(
             padding: const EdgeInsets.only(bottom:8.0),
             child: SecondaryButton(text: "a link",
             callback: () async {
    
            final Uri url = Uri.parse('https://guides.rockgarden.io'); 
             if (!await launchUrl(url)) {
                throw Exception('could not luanch $url');
              } 
            },)),
            buildVideo(),
          ],
        )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => Expanded(
    child: Stack(
          children: [
            buildVideoPlayer(),
            Positioned.fill(
              child: BasicOverlayWidget(
                controller: controller,
              ),
            )
          ],
        ),
  );

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

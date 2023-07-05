import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/basic_overlay_widget.dart';
import 'package:portfolio/widgets/secondary_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends ConsumerWidget {
  final VideoPlayerController controller;
  final String? uri;
  const VideoPlayerWidget({super.key, required this.controller, this.uri});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return controller.value.isInitialized
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              uri != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SecondaryButton(
                        text: "Go To Site",
                        callback: () async {
                          final Uri url =
                              Uri.parse('https://guides.rockgarden.io');
                          if (!await launchUrl(url)) {
                            throw Exception('could not luanch $url');
                          }
                        },
                      ))
                  : Container(),
              buildVideo(),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => Flexible(
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

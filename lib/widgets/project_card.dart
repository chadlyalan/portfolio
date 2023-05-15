import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class ProjectCard extends ConsumerStatefulWidget {
  final String description;
  final String imageName;
  final bool? swap;
  const ProjectCard(
      {super.key,
      required this.description,
      required this.imageName,
      this.swap});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool showHoverColor = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/rock_canyon_demo.mkv');
    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: showMediaDialogue,
      onHover: (value) {
        setState(() {
          showHoverColor = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: showHoverColor
            ? BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              )
            : null,
        child: Row(children: [
          widget.swap == null
              ? SizedBox(
                  width: width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.description,
                      softWrap: true,
                    ),
                  ))
              : Expanded(
                  child: SizedBox(
                      width: width * .6,
                      child:
                          Image.asset(widget.imageName, fit: BoxFit.fitHeight)),
                ),
          widget.swap == null
              ? Expanded(
                  child: SizedBox(
                      width: width * .6,
                      child:
                          Image.asset(widget.imageName, fit: BoxFit.fitHeight)),
                )
              : SizedBox(
                  width: width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.description,
                      softWrap: true,
                    ),
                  ))
        ]),
      ),
    );
  }

  showMediaDialogue() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return VideoPlayerWidget(controller: _controller);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class ProjectCard extends ConsumerStatefulWidget {
  final String description;
  final String imageName;
  final bool? swap;
  final String? uri;
  final String? videoName;
  const ProjectCard(
      {super.key,
      required this.description,
      required this.imageName,
      this.swap,
      this.uri,
      this.videoName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool showHoverColor = false;

  @override
  void initState() {
    if (widget.videoName != null) {
      _controller = VideoPlayerController.asset(widget.videoName!);
      _initializeVideoPlayerFuture = _controller.initialize();
    }

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
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: InkWell(
        onTap: widget.videoName != null ? showMediaDialogue : showNoVideoMessage,
        onHover: (value) {
          setState(() {
            showHoverColor = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: showHoverColor
              ? BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
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
                        height: height * .3,
                        child: widget.imageName.contains(".svg")
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  widget.imageName,
                                ),
                              )
                            : Image.asset(widget.imageName,
                                fit: BoxFit.contain)),
                  ),
            widget.swap == null
                ? Expanded(
                    child: SizedBox(
                        width: width * .6,
                        height: height * .3,
                        child: widget.imageName.contains(".svg")
                            ? SvgPicture.asset(
                                widget.imageName,
                              )
                            : Image.asset(widget.imageName,
                                fit: BoxFit.contain)),
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
                  return VideoPlayerWidget(
                    controller: _controller,
                    uri: widget.uri,
                  );
                } else {
                  return const Center(
                    child: Text("sorry no video here"),
                  );
                }
              },
            ),
          );
        });
  }

  showNoVideoMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Center(
              child: Text('sorry no video demo yet'),
            ),
          );
        });
  }
}

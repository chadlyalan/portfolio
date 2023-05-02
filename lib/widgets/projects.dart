import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/section_title.dart';

class Projects extends ConsumerStatefulWidget {
  const Projects({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectsState();
}

class _ProjectsState extends ConsumerState<Projects> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: (Column(
        children: [SectionTitle(text: 'Projects')],
      )),
    );
  }
}
// we're going to build a list of cards that display projects
    // when they hover they shine?
    // clicking brings up a pop up window of a video displaying them?
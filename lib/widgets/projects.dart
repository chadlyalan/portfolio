import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/section_title.dart';

import '../classes/utils.dart';

class Projects extends ConsumerStatefulWidget {
  const Projects({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectsState();
}

class _ProjectsState extends ConsumerState<Projects> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallStyle = TextStyle(
      fontSize: Utils().getSmallerSize(width),
      fontWeight: FontWeight.w200,
      color: Theme.of(context).colorScheme.primary,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(text: 'Projects'),
          // portfolio description "paragraph" text
          Text(
            "we're going to put some description of the projects i've worked on here",
            style: smallStyle,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8),
            child: ProjectCard(
              description:
                  "a description of the project, lets make it long just so that we can test if this text will wrap and stuff like a good text should",
              imageName: 'assets/rock_canyon.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8),
            child: ProjectCard(
              description:
                  "Flutter Web App that allows Rock Garden employees to update and delete Database records in realtime",
              imageName: 'assets/redpoint.png',
              swap: true,
            ),
          ),
        ],
      )),
    );
  }
}
// we're going to build a list of cards that display projects
    // when they hover they shine?
    // clicking brings up a pop up window of a video displaying them?
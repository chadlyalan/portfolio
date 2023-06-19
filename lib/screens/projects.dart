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
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(text: 'Projects'),
        Text(
          "we're going to put some description of the projects i've worked on here",
          style: smallStyle,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: ProjectCard(
            description:
                "A Flutter Web App that integrates with a Firebase back-end. It lazy loads images from Firebase, and uses pointer recognition to dynamically display different angles of the route to create a 3D effect. Go check it out.",
            imageName: 'assets/rg-wordmark.svg',
            uri: "guides.rockgarden.io",
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: ProjectCard(
            description:
                "Flutter Web App that allows Rock Garden employees to update and delete Database records in realtime",
            imageName: 'assets/rock-garden.svg',
            swap: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: ProjectCard(
            description:
                "React.js weather app. It uses the openweather API to generate a 5 day weather forecast.",
            imageName: 'assets/react-icon.svg',
          ),
        ),
      ],
    ));
  }
}

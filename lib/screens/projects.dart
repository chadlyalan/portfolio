import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/section_title.dart';

// import '../classes/utils.dart';

class Projects extends ConsumerStatefulWidget {
  const Projects({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectsState();
}

class _ProjectsState extends ConsumerState<Projects> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final smallStyle = TextStyle(
    //   fontSize: Utils().getSmallerSize(width),
    //   fontWeight: FontWeight.w200,
    //   color: Theme.of(context).colorScheme.primary,
    // );
    return (const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(text: 'Projects'),
        // there's an "uncaught" error in profile and release mode for some reason and it doesn't seem
        // to be effecting the website at all.. but it bugs me.. lol
        Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Text(
            "These are some of my more recent projects. I Love working with flutter, though I have dabbled with React.js and Python in the past.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ),
        ProjectCard(
          description:
              "A Flutter Web App that integrates with a Firebase back-end. It lazy loads images from Firebase, and uses pointer recognition to dynamically display different angles of the route to create a 3D effect. Go check it out.",
          imageName: 'assets/rg-wordmark.svg',
          uri: "guides.rockgarden.io",
          videoName: "assets/rock_canyon_demo.mkv",
        ),
        ProjectCard(
          description:
              "Flutter Web App that allows Rock Garden employees to update and delete Database records in realtime",
          imageName: 'assets/rock-garden.svg',
          swap: true,
        ),
        ProjectCard(
          description:
              "React.js weather app. It uses the openweather API to generate a 5 day weather forecast.",
          imageName: 'assets/react-icon.svg',
          videoName: "assets/reactjs-weather.mp4",
        ),
      ],
    ));
  }
}

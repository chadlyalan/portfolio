import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/about_card.dart';
import 'package:portfolio/widgets/section_title.dart';

class About extends ConsumerStatefulWidget {
  const About({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutState();
}

class _AboutState extends ConsumerState<About> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(text: 'About Me'),
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Text(
            "Since earning my BS in Computer Information Technology, I've built web apps with Flutter and React.js, worked with Technical Project Managers and supported Server & Network Administrators.  I've been on amazing teams and been the lone wolf Dev in a startup. I love working with people, and learning new tech.",
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          childAspectRatio: 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: width < 960 ? 2 : 3,
          children: const [
            AboutCard(
              title: "Flutter Development",
              description:
                  "Flutter is my UI development kit of choice right now. I have experience building web and mobile apps with a single codebase.  I love to build dynamic and reactive UIs, and the past year of learning Flutter has been a blast!",
              color: Colors.blueAccent,
              iconName: "flutter.svg",
            ),
            AboutCard(
              title: 'Project Management',
              description:
                  "As an Assistant Project Manager I had the incredible opportunity to learn from 3 Project Mangers in the BYU-Idaho IT Department. I learned what it takes to manage a team of developers and effectively communicate needs between the customer and dev team. I've found that as a developer this experience has been incredibly useful.",
              color: Colors.greenAccent,
              iconName: "konbon.svg",
            ),
            AboutCard(
              title: 'Server Administration',
              description:
                  'While supporting server-side software and the corresponding clients, I learned to be proficient in Linux and Network troubleshooting. This has been incredibly useful when working with servers, and troubleshooting issues.',
              color: Colors.yellowAccent,
              iconName: "server-color.svg",
            ),
            AboutCard(
              title: 'Google Firebase',
              description:
                  'I have developed apps and websites that make use of the Firebase Realtime Database (a No SQL DB), Firestore, Cloud Storage, and Cloud Functions. The Cloud functions were written in Node.js.',
              color: Colors.yellowAccent,
              iconName: "firebase-logo.svg",
            ),
            AboutCard(
              title: 'Swimming',
              description:
                  "I have been swimming competitvely since High School. It's something I continue to do and am quite passionate about. I was Swim Captain in High school, and while at BYU-Idaho I won a small scholarship for swimming.",
              color: Colors.pinkAccent,
              iconName: "swimming-color.svg",
            ),
            AboutCard(
              title: 'Rock Climbing',
              description:
                  "I've been rock climbing for a couple years now and I can't seem to get enough of it. If I'm not at work or at home, it's highly likely I'm at a climbing gym, or outside climbing on some rocks.",
              color: Colors.pinkAccent,
              iconName: "climbing-color.svg",
            ),
          ],
        ),
      ],
    );
  }
}

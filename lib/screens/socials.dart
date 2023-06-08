import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/social_card.dart';

class Socials extends ConsumerWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: 'Socials'),
        GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          childAspectRatio: 1,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: const [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: SocialCard(
                title: "GitHub",
                color: Colors.grey,
                destination: "https://github.com/chadlyalan",
                iconName: "github-mark-white.svg",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: SocialCard(
                title: "LinkedIn",
                color: Colors.blueAccent,
                destination:
                    "https://www.linkedin.com/in/chad-thomas-162707119/",
                iconName: 'linked-in-blue.png',
                isSvg: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: SocialCard(
                title: "Gmail",
                color: Colors.redAccent,
                destination:
                    "mailto:chadat37@gmail.com?subject=An offer you can't refuse&body=",
                iconName: "gmail.svg",
              ),
            ),
            // this is for the resume that we aren't going to use for now
            // Padding(
            //   padding: EdgeInsets.all(6.0),
            //   child: SocialCard(
            //     title: "Resume",
            //     color: Colors.greenAccent,
            //     destination:
            //         "assets/resume2023.pdf",
            //     iconName: "resume1.svg",
            //     isPdf: true,
            //   ),
            // ),
          ],
        )
      ],
    ));
  }
}

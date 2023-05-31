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
            SocialCard(
              title: "GitHub",
              color: Colors.grey,
              destination: "https://github.com/chadlyalan",
              iconName: "github-mark-white.svg",
            ),
            SocialCard(
                title: "LinkedIn",
                color: Colors.blueAccent,
                destination:
                    "https://www.linkedin.com/in/chad-thomas-162707119/")
          ,SocialCard(
              title: "E-Mail",
              color: Colors.redAccent,
              destination: "mailto:chadat37@gmail.com?subject=An offer you can't refuse&body=New%20plugin",
              iconName: "gmail.svg",
            ),
          
          ],
        )
      ],
    ));
  }
}

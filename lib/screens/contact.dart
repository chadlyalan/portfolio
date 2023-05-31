import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/social_card.dart';

class Contact extends ConsumerStatefulWidget {
  const Contact({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactState();
}

class _ContactState extends ConsumerState<Contact> {
  @override
  Widget build(BuildContext context) {
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
            SocialCard(title: "GitHub", color: Colors.grey, destination: "https://github.com/chadlyalan", iconName: "github-mark-white.svg",)
          ],)
        ],
    ));
  }
}

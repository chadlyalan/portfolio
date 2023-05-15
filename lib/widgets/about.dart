import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/section_title.dart';

class About extends ConsumerStatefulWidget {
  const About({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutState();
}

class _AboutState extends ConsumerState<About> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: (Column(
        children: [SectionTitle(text: 'About Me')],
      )),
    );
  }
}

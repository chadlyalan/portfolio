import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/section_title.dart';

class Contact extends ConsumerStatefulWidget {
  const Contact({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactState();
}

class _ContactState extends ConsumerState<Contact> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: (Column(
        children: [SectionTitle(text: 'Contact Me')],
      )),
    );
  }
}

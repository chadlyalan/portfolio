import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/about.dart';
import 'package:portfolio/widgets/contact.dart';
import 'package:portfolio/widgets/landing.dart';
import 'package:portfolio/widgets/projects.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomepageState();
}

class HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Landing(),
            Projects(),
            About(),
            Contact(),
          ],
        ),
      ),
    );
  }
}

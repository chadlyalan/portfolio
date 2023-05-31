import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/landing.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/socials.dart';
import 'package:portfolio/widgets/side_panel.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider =
    StateProvider<ItemScrollController>((ref) => ItemScrollController());

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomepageState();
}

class HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final itemController = ref.read(scrollControllerProvider);

    return Scaffold(
      drawer: width <= 960 ? const SidePanel() : null,
      body: Row(
        children: [
          (width > 960) ? const SidePanel() : Container(),
          Expanded(
            child: ScrollablePositionedList.builder(
              addAutomaticKeepAlives: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AppBar(
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: Theme.of(context).colorScheme.secondary,
                      ));
                } else if (index == 1) {
                  return const Landing();
                } else if (index == 2) {
                  return const Projects();
                } else if (index == 3) {
                  return const About();
                } else {
                  return const Socials();
                }
              },
              itemScrollController: itemController,
            ),
          ),
        ],
      ),
    );
  }
}

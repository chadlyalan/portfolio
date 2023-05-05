import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/about.dart';
import 'package:portfolio/widgets/contact.dart';
import 'package:portfolio/widgets/landing.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/side_panel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
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
              itemCount: 5,
              itemBuilder: (context, index) => buildSection(index),
              itemScrollController: itemController,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(int index) {
    if (index == 0) {
      return AppBar(
        elevation: 0,
      );
    } else if (index == 1) {
      return Landing();
    } else if (index == 2) {
      return Projects();
    } else if (index == 3) {
      return About();
    } else {
      return Contact();
    }
  }
}

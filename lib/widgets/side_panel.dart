import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SidePanel extends ConsumerStatefulWidget {
  const SidePanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SidePanelState();
}

class _SidePanelState extends ConsumerState<SidePanel> {
  @override
  Widget build(BuildContext context) {
    final scroller = ref.read(scrollControllerProvider);
    return Material(
        //color: Color(0xFF262626),
        child: SizedBox(
      width: 125,
      child: Column(
        children: <Widget>[
          buildHeader(context),
          const Spacer(),
          buildMenu(context, scroller),
          const Spacer(),
          buildSocials(context),
        ],
      ),
    ));
  }

  Widget buildHeader(BuildContext context) => const Padding(
        padding: EdgeInsets.all(24),
        child: Column(children: [
          Text(
            'Chad',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ]),
      );

  Widget buildMenu(BuildContext context, ItemScrollController controller) =>
      Expanded(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 1, duration: const Duration(milliseconds: 800));
              },
              child: const Text('Top')),
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 2, duration: const Duration(milliseconds: 800));
              },
              child: const Text('Projects')),
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 3, duration: const Duration(milliseconds: 800));
              },
              child: const Text('About Me')),
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 4, duration: const Duration(milliseconds: 1000));
              },
              child: const Text('Contact Me')),
        ],
      ));

  Widget buildSocials(BuildContext context) => const Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox),
          Icon(Icons.person),
        ],
      ));
}

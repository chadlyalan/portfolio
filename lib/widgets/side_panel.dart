import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
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
      width: 269,
      child: Column(
        children: <Widget>[
          buildHeader(context),
          buildMenu(context, scroller),
        ],
      ),
    ));
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: EdgeInsets.all(24),
        child: Column(children: const [
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
                    index: 2, duration: Duration(milliseconds: 800));
              },
              child: Text('Projects')),
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 3, duration: Duration(milliseconds: 800));
              },
              child: Text('About Me')),
          TextButton(
              onPressed: () {
                controller.scrollTo(
                    index: 4, duration: Duration(milliseconds: 800));
              },
              child: Text('Contact Me')),
        ],
      ));
}

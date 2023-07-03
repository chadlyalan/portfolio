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
        color: Theme.of(context).colorScheme.background,
        child: SizedBox(
          width: 125,
          child: Column(
            children: <Widget>[
              buildHeader(context),
              const Spacer(),
              buildMenu(context, scroller),
              const Spacer(),
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
                controller.jumpTo(
                  index: 2,
                );
              },
              child: const Text('Projects',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // color: Theme.of(context).colorScheme.secondary
                  ))),
          TextButton(
              onPressed: () {
                controller.jumpTo(
                  index: 3,
                );
              },
              child: const Text('About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // color: Theme.of(context).colorScheme.secondary
                  ))),
          TextButton(
              onPressed: () {
                controller.jumpTo(
                  index: 4,
                  alignment: 0,
                );
              },
              child: const Text('Socials',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // color: Theme.of(context).colorScheme.secondary
                  ))),
        ],
      ));
}

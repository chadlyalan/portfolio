import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/widgets/custom_animated_text.dart';
import 'package:portfolio/widgets/custom_opacity.dart';
import '../classes/utils.dart';
import '../widgets/secondary_button.dart';

// we converted this landing widget into a stateless widget because
// the animated text was freaking out when setState was called.
// I extracted all of the setState functionality to their individual
// widgets, and let landing page worry less about the
class Landing extends ConsumerWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we're setting some style up here using the theme so that when the
    // theme switches, so do our colors.
    final scroller = ref.read(scrollControllerProvider);
    final width = MediaQuery.of(context).size.width;
    final theme = ref.watch(themeModeProvider);

    final colorTitle = TextStyle(
      fontSize: Utils().getTitleSize(width),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.secondary,
    );
    final plainTitle = TextStyle(
      fontSize: Utils().getTitleSize(width),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.primary,
    );
    final smallStyle = TextStyle(
      fontSize: Utils().getSmallSize(width),
      fontWeight: FontWeight.w200,
      color: Theme.of(context).colorScheme.primary,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Align(
          alignment: Alignment.center,
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomAnimatedText(
                        unique: ObjectKey({
                          "value:": "Hi",
                          "theme": theme == ThemeMode.dark ? "dark" : "light"
                        }),
                        text: 'Hi',
                        style: plainTitle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomAnimatedText(
                            unique: ObjectKey({
                              "value:": "I'm",
                              "theme":
                                  theme == ThemeMode.dark ? "dark" : "light"
                            }),
                            text: "I'm",
                            style: plainTitle,
                            cursor: " ",
                            delay: 500,
                          ),
                        ),
                        Flexible(
                          child: CustomAnimatedText(
                            unique: ObjectKey({
                              "value:": "Chad",
                              "theme":
                                  theme == ThemeMode.dark ? "dark" : "light"
                            }),
                            text: 'Chad',
                            style: colorTitle,
                            delay: 800,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomAnimatedText(
                      unique: ObjectKey({
                        "value:": "software engineer",
                        "theme": theme == ThemeMode.dark ? "dark" : "light"
                      }),
                      text: 'Software Engineer',
                      style: plainTitle,
                      delay: 1400,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomOpacity(
                        text: "Web & Mobile Developer",
                        delay: 1200,
                        style: smallStyle,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12),
                      child: SecondaryButton(
                        text: 'Contact Me',
                        callback: () => scroller.jumpTo(
                          index: 4,
                        ),
                      )),
                  const SizedBox(
                    height: 200,
                  )
                ],
              ))),
    );
  }
}

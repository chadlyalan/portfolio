import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/widgets/custom_animated_text.dart';
import 'package:portfolio/widgets/secondaryButton.dart';

import '../classes/utils.dart';

class Landing extends ConsumerStatefulWidget {
  const Landing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingState();
}

class _LandingState extends ConsumerState<Landing> {
  bool showName = false;
  bool showName2 = false;
  bool showTitle = false;
  bool smallTitle = false;
  double opacity = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startAnimations();
  }

  // I'm overriding the setState function itself here to make sure
  // that i'm not calling setState if the widget itself isn't currently
  // mounted. I was having issues with the timers attempting to set
  // state while the landing widget wasn't mounted. (after dispose)
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  startAnimations() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        showName = true;
      });
    });

    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        showName2 = true;
      });
    });
    Timer(const Duration(milliseconds: 1400), () {
      setState(() {
        showTitle = true;
        smallTitle = true;
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // we're setting some style up here using the theme so that when the
    // theme switches, so do our colors.
    final scroller = ref.read(scrollControllerProvider);
    final width = MediaQuery.of(context).size.width;

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
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Hi',
                              textStyle: plainTitle,
                              speed: const Duration(milliseconds: 100),
                              cursor: '|'),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                  showName
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText("I'm ",
                                      textStyle: plainTitle,
                                      speed: const Duration(milliseconds: 100),
                                      cursor: ''),
                                ],
                                isRepeatingAnimation: false,
                              ),
                              showName2
                                  ? AnimatedTextKit(
                                      animatedTexts: [
                                        TypewriterAnimatedText("Chad",
                                            textStyle: colorTitle,
                                            speed: const Duration(
                                                milliseconds: 100),
                                            cursor: "|"),
                                      ],
                                      isRepeatingAnimation: false,
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 56,
                        ),
                  showTitle
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomAnimatedText(
                            text: 'Software Engineer',
                            style: plainTitle,
                          ),
                        )
                      : const SizedBox(
                          height: 56,
                        ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(seconds: 1),
                        child:
                            Text('Web & Mobile Developer', style: smallStyle),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12),
                      child: SecondaryButton(
                        text: 'Contact Me',
                        callback: () => scroller.scrollTo(
                            index: 4, duration: const Duration(milliseconds: 1000)),
                      )),
                  const SizedBox(
                    height: 200,
                  )
                ],
              ))),
    );
  }
}

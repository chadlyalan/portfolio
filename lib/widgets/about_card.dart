import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutCard extends ConsumerWidget {
  final String title;
  final String description;
  final String? iconName;
  final Color color;
  const AboutCard(
      {super.key,
      required this.title,
      required this.color,
      required this.description,
      this.iconName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    cardpopup() {
      showDialog(
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: .75,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: color),
                    borderRadius: BorderRadius.circular(15)),
                title: Text(title),
                content: Text(description),
              ),
            );
          });
    }

    final width = MediaQuery.of(context).size.width;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: cardpopup,
        hoverColor: color.withOpacity(.5),
        dense: true,
        title: 
             Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                child: AutoSizeText(
                  title,
                  minFontSize: width >= 675 ? 24 : 12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
             ,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: FractionallySizedBox(
              heightFactor: .7,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Align(
                    alignment: Alignment.center,
                    child: iconName != null
                        ? SvgPicture.asset(
                            iconName!,
                            semanticsLabel: title,
                          )
                        : const Icon(Icons.folder)),
              )),
        ),
      ),
    );
  }
}

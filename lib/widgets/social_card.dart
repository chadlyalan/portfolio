import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pdfx/pdfx.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCard extends ConsumerWidget {
  final String title;
  final String destination;
  final String? iconName;
  final Color color;
  final bool isSvg;
  // final bool isPdf;
  const SocialCard(
      {super.key,
      required this.title,
      required this.color,
      required this.destination,
      this.isSvg = true,
      // this.isPdf = false,
      this.iconName});

  // PdfDocument getDocument()  {
  //   return PdfDocument.openAsset(destination);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // late final PdfController pdfPinchController;
    // late PdfDocument document;
    // if (isPdf) {
    //   document = getDocument();
    // }

    // if (isPdf) {
    //   pdfPinchController =
    //       PdfController(document: document);
    // }

    // showPdf(BuildContext context) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           content: PdfView(controller: pdfPinchController),
    //         );
    //       });
    // }
    final width = MediaQuery.of(context).size.width;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () async {
          final Uri url = Uri.parse(destination);
          if (!await launchUrl(url)) {
            throw Exception('could not launch $url');
          }
        },
        hoverColor: color.withOpacity(.5),
        dense: true,
        title: width >= 960
            ? Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                child: AutoSizeText(
                  title,
                  minFontSize: 24,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: FractionallySizedBox(
              heightFactor: .7,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Align(
                    alignment: Alignment.center,
                    child: iconName != null
                        ? isSvg
                            ? SvgPicture.asset(
                                iconName!,
                                semanticsLabel: title,
                              )
                            : Image.asset(iconName!)
                        : const Icon(Icons.folder)),
              )),
        ),
      ),
    );
  }
}

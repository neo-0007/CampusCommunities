import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';

class PdfViewingScreen extends StatelessWidget {
  final String url;
  final String pdfTitle;
  const PdfViewingScreen(
      {super.key, required this.pdfTitle, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCustom(),
        title: Text(pdfTitle),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (progress) => Center(
          child: Text('$progress %'),
        ),
        errorWidget: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }
}

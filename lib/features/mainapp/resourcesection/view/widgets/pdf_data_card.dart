import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/screens/pdf_viewing_screen.dart';

class PdfDataCard extends StatefulWidget {
  final String pdfUrl;
  final String uploadedBy;
  final String uploadDate;
  final String pdfTitle;
  final String topicName;
  const PdfDataCard(
      {super.key,
      required this.topicName,
      required this.pdfUrl,
      required this.uploadedBy,
      required this.uploadDate,
      required this.pdfTitle});

  @override
  State<PdfDataCard> createState() => _PdfDataCardState();
}

class _PdfDataCardState extends State<PdfDataCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewingScreen(
                pdfTitle: widget.pdfTitle,
                url:
                    //  'https://gzjqpcgufcyiodgfqzka.supabase.co/storage/v1/object/public/CampusCommunities/English/PPTs/ROHI.pdf?t=2024-07-19T10%3A01%3A18.521Z'
                    widget.pdfUrl),
          ),
        );
      },
      child: Container(
        color: ReplyAppColors.nearlyWhite,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListTile(
          leading: SizedBox(
            width: 40,
            child: SvgPicture.asset('assets/images/pdf-svgrepo-com.svg'),
          ),
          title: Text(
            widget.pdfTitle,
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          subtitle: Text('By :${widget.uploadedBy}'),
          trailing: Text(widget.uploadDate),
        ),
      ),
    );
  }
}

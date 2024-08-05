import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/pdf_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/repository/resource_repository.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/widgets/pdf_data_card.dart';

class TopicDataScreen extends StatefulWidget {
  final int topicId;
  final String topicName;
  const TopicDataScreen(
      {super.key, required this.topicName, required this.topicId});

  @override
  State<TopicDataScreen> createState() => _TopicDataScreenState();
}

class _TopicDataScreenState extends State<TopicDataScreen>
    with AutomaticKeepAliveClientMixin<TopicDataScreen> {
  @override
  bool get wantKeepAlive => true;

  ResourceRepository resourceRepository = ResourceRepository();
  List<PdfModel> pdfs = [];

  @override
  void initState() {
    super.initState();
    getPdfModels();
  }

  void getPdfModels() async {
    final List<PdfModel> fetchedPdfs =
        await resourceRepository.fetchPdfFiles(widget.topicId);
    setState(() {
      pdfs = fetchedPdfs;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ReplyAppColors.notWhite,
        appBar: AppBar(
          bottom: TabBar(
              labelColor: ReplyAppColors.darkerText,
              indicatorColor: ReplyAppColors.dismissibleBackground,
              tabs: [
                Tab(
                  child: Text(
                    'Notes',
                    style: GoogleFonts.roboto(fontSize: 13),
                  ),
                ),
                Tab(
                  child: Text(
                    'extras',
                    style: GoogleFonts.roboto(),
                  ),
                ),
                Tab(
                  child: Text(
                    'Guide',
                    style: GoogleFonts.roboto(fontSize: 13),
                  ),
                ),
                Tab(
                  child: Text(
                    'PYQ',
                    style: GoogleFonts.roboto(fontSize: 13),
                  ),
                ),
              ]),
          backgroundColor: ReplyAppColors.notWhite,
          leading: const BackButtonCustom(),
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              widget.topicName,
              style: GoogleFonts.workSans(
                  color: ReplyAppColors.darkerText,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: TabBarView(children: [
          (pdfs.isEmpty)
              ? const Center(
                  child: Text('No PDFs found !'),
                )
              : ListView.builder(
                  itemCount: pdfs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PdfDataCard(
                      pdfTitle: pdfs[index].pdfTitle,
                      pdfUrl: pdfs[index].pdfUrl,
                      uploadedBy: pdfs[index].uploadedBy,
                      uploadDate: pdfs[index].uploadDate,
                      topicName: widget.topicName,
                    );
                  }),
          const Center(
            child: Text('Other Resources'),
          ),
          const Center(
            child: Text('Guides'),
          ),
          const Center(
            child: Text('PYQ'),
          ),
        ]),
      ),
    );
  }
}

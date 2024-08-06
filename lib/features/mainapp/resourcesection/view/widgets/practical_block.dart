import 'package:CampusCommunities/features/mainapp/resourcesection/models/practical_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/repository/resource_repository.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/widgets/practical_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PracticalBlock extends StatefulWidget {
  final int semesterNo;
  const PracticalBlock({super.key, required this.semesterNo});

  @override
  State<PracticalBlock> createState() => _PracticalBlockState();
}

class _PracticalBlockState extends State<PracticalBlock> {
  List<PracticalModel> practicals = [];
  bool isLoading = false;

  ResourceRepository resourceRepository = ResourceRepository();

  @override
  void initState() {
    super.initState();
    getPracticals();
  }

  void getPracticals() async {
    final List<PracticalModel> fetchedPracticals = await resourceRepository
        .fetchPracticalData(semesterId:widget.semesterNo);
    setState(() {
      practicals = fetchedPracticals;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Practicals',
            style:
                GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(
            height: screenSize.height / 7,
            width: screenSize.width - 10,
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: practicals.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return practicals.isEmpty
                          ? const Center(child: Text('No topic found !'))
                          : PracticalCard(
                              practicalId: practicals[index].practicalId,
                              practicalName: practicals[index].practicalName,
                              practicalImageUrl:
                                  practicals[index].practicalImageUrl,
                            ); //topicImageUrl: topics[index].topicImageUrl,
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

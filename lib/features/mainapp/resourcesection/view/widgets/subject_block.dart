import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/repository/resource_repository.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/topic_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/widgets/chapter_card.dart';

class SubjectBlock extends StatefulWidget {
  final String subjectName;
  final int topicCount;
  final String courseCode;
  final int credits;
  final int courseId;

  const SubjectBlock(
      {super.key,
      required this.subjectName,
      required this.topicCount,
      required this.courseCode,
      required this.credits,
      required this.courseId});

  @override
  State<SubjectBlock> createState() => _SubjectBlockState();
}

class _SubjectBlockState extends State<SubjectBlock> {
  List<TopicModel> topics = [];
  bool isLoading = true;
  ResourceRepository resourceRepository = ResourceRepository();

  @override
  void initState() {
    super.initState();
    getTopics();
  }

  void getTopics() async {
    final List<TopicModel> fetchedTopics =
        await resourceRepository.fetchTopicData(courseId: widget.courseId);
    setState(() {
      topics = fetchedTopics;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.subjectName} (${widget.courseCode}) | CR:${widget.credits}',
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
                    itemCount: widget.topicCount,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return topics.isEmpty
                          ? const Center(child: Text('No topic found !'))
                          : ChapterCard(
                              topicId: topics[index].topicId,
                              topicName: topics[index].topicName,
                              topicImageUrl: topics[index].topicImageUrl,
                            ); //topicImageUrl: topics[index].topicImageUrl,
                    },
                    ),
          ),
        ],
      ),
    );
  }
}

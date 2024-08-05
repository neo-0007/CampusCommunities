import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/screens/topic_data_screen.dart';

class ChapterCard extends StatelessWidget {
  final int topicId;
  final String topicName;
  final String topicImageUrl;
  // final String topicImageUrl;
  const ChapterCard(
      {super.key,
      required this.topicId,
      required this.topicName,
      this.topicImageUrl =
          '//gzjqpcgufcyiodgfqzka.supabase.co/storage/v1/object/public/CampusCommunities/common-assets/blank_white_image.jpg?t=2024-07-17T13%3A04%3A02.504Z'}); //, required this.topicImageUrl

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: screenSize.width / 3.5,
        width: screenSize.width / 3.5,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDataScreen(
                  topicName: topicName,
                  topicId: topicId,
                ),
              ),
            );
          },
          child: Card(
            color: ReplyAppColors.nearlyWhite,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.network(
                    topicImageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          topicName,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                            color: ReplyAppColors.nearlyWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

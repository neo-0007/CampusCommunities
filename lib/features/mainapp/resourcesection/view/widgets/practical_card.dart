import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class PracticalCard extends StatelessWidget {
  final int practicalId;
  final String practicalName;
  final String practicalImageUrl;
  const PracticalCard(
      {super.key,
      required this.practicalId,
      required this.practicalName,
      this.practicalImageUrl =
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TopicDataScreen(
            //       topicName: practicalName,
            //       topicId: practicalId,
            //     ),
            //   ),
            // );
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
                    practicalImageUrl,
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
                          practicalName,
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

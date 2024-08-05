class TopicModel {
  final String topicName;
  final String topicImageUrl;
  final int courseId;
  final int topicId;
  // final String topicImageUrl;

  TopicModel({
    required this.topicId,
    required this.topicName,
    required this.topicImageUrl,
    required this.courseId,
  }); //, required this.topicImageUrl

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
        topicId: json['id'],
        topicName: json['topic_name'],
        topicImageUrl: json['topic_image_url'],
        courseId: json['course_id']); //, topicImageUrl: json['topic_image_url']
  }
}

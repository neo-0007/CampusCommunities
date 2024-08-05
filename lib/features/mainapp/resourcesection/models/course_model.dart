class CourseModel {
  final int id;
  final String courseName;
  final String courseCode;
  final int credits;
  final int semesterId;
  final int topicCount;

  CourseModel({
    required this.topicCount,
    required this.id,
    required this.courseName,
    required this.courseCode,
    required this.credits,
    required this.semesterId,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      courseName: json['course_name'],
      courseCode: json['course_code'],
      credits: json['credits'],
      semesterId: json['semester_id'],
      topicCount: json['topic_count']
    );
  }
}

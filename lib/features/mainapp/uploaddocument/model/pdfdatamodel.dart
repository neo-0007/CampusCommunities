
class Course {
  final int id;
  final String name;
  final int semesterId;

  Course({required this.id, required this.name, required this.semesterId});
}

class Topic {
  final int id;
  final String name;
  final int courseId;

  Topic({required this.id, required this.name, required this.courseId});
}

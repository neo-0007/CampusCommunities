class UserModel {
  final String userId;
  final String userName;
  final String department;
  final int semesterNo;
  final String rollNo;
  final String instituteName;

  UserModel(
      {required this.userId,
      required this.userName,
      required this.department,
      required this.semesterNo,
      required this.rollNo,
      required this.instituteName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['id'],
        userName: json['username'],
        department: json['department'],
        semesterNo: json['semester'],
        rollNo: json['roll_number'],
        instituteName: json['institute']);
  }
}

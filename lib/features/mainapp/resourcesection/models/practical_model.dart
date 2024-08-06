class PracticalModel {
  final String practicalName;
  final String practicalImageUrl;
  final int practicalId;
  final int semesterId;

  PracticalModel( 
    {
    required this.practicalName, 
    required this.practicalImageUrl,   
    required this.practicalId,
    required this.semesterId,
      });

  factory PracticalModel.fromJson(Map<String, dynamic> json) {
    return PracticalModel(
        practicalId: json['id'],
        practicalName: json['practical_name'],
        practicalImageUrl: json['practical_image_url'],
        semesterId: json['semester_id']
        ); 
  }
}

import 'package:CampusCommunities/features/mainapp/resourcesection/models/course_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/pdf_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/practical_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/topic_model.dart';
import 'package:CampusCommunities/utils/constants.dart';

class ResourceRepository {
  Future<List<CourseModel>> fetchCourseData(int semesterId) async {
    try {
      final response = await supabaseClient
          .from('courses')
          .select('*')
          .eq('semester_id', semesterId);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } catch (error) {
      return [];
    }
  }

  Future<List<String>> fetchCourseNames(int semesterId) async {
    try {
      final response = await supabaseClient
          .from('courses')
          .select('course_name')
          .eq('semester_id', semesterId);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => json['course_name'] as String).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<TopicModel>> fetchTopicData({required int courseId}) async {
    try {
      final response = await supabaseClient
          .from('topics')
          .select('*')
          .eq('course_id', courseId);
      final List<dynamic> data = response as List<dynamic>;
      return data.map((value) => TopicModel.fromJson(value)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<String>> fetchTopicNames(int courseId) async {
    try {
      final response = await supabaseClient
          .from('topics')
          .select('topic_name')
          .eq('course_id', courseId);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => json['topic_name'] as String).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PdfModel>> fetchPdfFiles(int topicId) async {
    try {
      final response = await supabaseClient
          .from('pdf_notes')
          .select()
          .eq('topic_id', topicId);
      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => PdfModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PracticalModel>> fetchPracticalData(
      {required int semesterId}) async {
    try {
      final response = await supabaseClient
          .from('practicals')
          .select('*')
          .eq('semester_id',semesterId);
      final List<dynamic> data = response as List<dynamic>;
      return data.map((value) => PracticalModel.fromJson(value)).toList();
    } catch (e) {
      return [];
    }
  }
}

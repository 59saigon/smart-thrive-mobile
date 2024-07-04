import 'package:smart_thrive_mobile/models/subject.dart';

class Category {
  final String categoryName;
  final List<Subject>? subjects;
  String thumbnail;

  Category({
    required this.categoryName,
    this.subjects,
    required this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var subjectList = json['subjects'] as List?;
    List<Subject> subjectItems = subjectList != null
        ? subjectList.map((i) => Subject.fromJson(i)).toList()
        : [];

    return Category(
      categoryName: json['categoryName'],
      subjects: subjectItems,
      thumbnail: 'assets/icons/design.jpg',
    );
  }
}

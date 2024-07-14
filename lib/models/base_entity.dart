class BaseEntity {
  String id;
  String? createdBy;
  DateTime createdDate;
  String? lastUpdatedBy;
  DateTime? lastUpdatedDate;
  bool isDeleted;

  BaseEntity({
    required this.id,
    this.createdBy,
    required this.createdDate,
    this.lastUpdatedBy,
    this.lastUpdatedDate,
    required this.isDeleted,
  });

  factory BaseEntity.fromJson(Map<String, dynamic> json) {
    return BaseEntity(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'createdDate': createdDate.toIso8601String(),
      'lastUpdatedBy': lastUpdatedBy,
      'lastUpdatedDate': lastUpdatedDate?.toIso8601String(),
      'isDeleted': isDeleted,
    };
  }
}

import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/package.dart';

class Order extends BaseEntity {
  String packageId;
  String? paymentMethod;
  int? amount;
  double? totalPrice;
  String? description;
  bool? status;
  Package? package;

  Order({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.packageId,
    this.paymentMethod,
    this.amount,
    this.totalPrice,
    this.description,
    this.status,
    this.package,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      packageId: json['packageId'],
      paymentMethod: json['paymentMethod'],
      amount: json['amount'],
      totalPrice: json['totalPrice'],
      description: json['description'],
      status: json['status'],
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
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
      'packageId': packageId,
      'paymentMethod': paymentMethod,
      'amount': amount,
      'totalPrice': totalPrice,
      'description': description,
      'status': status,
      'package': package?.toJson(),
    };
  }
}

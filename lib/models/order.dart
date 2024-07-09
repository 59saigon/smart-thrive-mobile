import 'package:smart_thrive_mobile/models/package.dart';

class Order {
  final String packageId;
  final String? paymentMethod;
  final int? amount;
  final double? totalPrice;
  final String? description;
  final bool? status;
  final Package? package;

  Order({
    required this.packageId,
    this.paymentMethod,
    this.amount,
    this.totalPrice,
    this.description,
    this.status,
    this.package,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      packageId: json['packageId'],
      paymentMethod: json['paymentMethod'],
      amount: json['amount'],
      totalPrice: json['totalPrice']?.toDouble(),
      description: json['description'],
      status: json['status'],
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
    );
  }
}

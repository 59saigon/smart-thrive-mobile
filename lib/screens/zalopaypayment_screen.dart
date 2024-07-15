import 'package:flutter/material.dart';

class ZaloPayPayment extends StatefulWidget {
  const ZaloPayPayment({super.key});

  @override
  State<ZaloPayPayment> createState() => _ZaloPayPaymentState();
}

class _ZaloPayPaymentState extends State<ZaloPayPayment> {
  String orderId = "E9DF9269-C042-451A-9222-4F4B9B36840E";
  String packageId = "2884DAA7-7EAC-40E4-965E-48A2986DCC38";

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thanh toán thành công'),
          content: const Text('Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _cancelPayment() {
    Navigator.of(context).pop();
  }

  void _makePayment() {
    Future.delayed(const Duration(seconds: 2), () {
      _showSuccessDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán qua ZaloPay'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/icons/zalopay_logo.jpg',
              height: 100,
            ),
            const SizedBox(height: 40),
            const Text(
              'Thông tin thanh toán',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PaymentInfoRow(label: 'OrderId:', value: orderId),
            PaymentInfoRow(label: 'PackageId:', value: packageId),
            const PaymentInfoRow(label: 'Số tiền:', value: '500,000 VND'),
            const PaymentInfoRow(
                label: 'Nội dung:', value: 'Thanh toán khóa học'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _makePayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Thanh toán'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cancelPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const PaymentInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

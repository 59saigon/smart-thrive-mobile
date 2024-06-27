import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class APIService {
  static const String baseUrl = 'https://10.0.2.2:7999/api'; // Android emulator

  static http.Client createHttpClient() {
    final ioClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(ioClient);
  }

  static Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    final client = createHttpClient();

    try {
      final response = await client.post(
        Uri.parse('$baseUrl/User/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'usernameOrEmail': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login');
      }
    } finally {
      client.close();
    }
  }

  static Future<Map<String, dynamic>> registerUser(
      String username, String password) async {
    final client = createHttpClient();

    try {
      final response = await client.post(
        Uri.parse('$baseUrl/User/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register');
      }
    } finally {
      client.close();
    }
  }
}

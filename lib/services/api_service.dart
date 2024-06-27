import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_thrive_mobile/models/package.dart';

class APIService {
  static const String baseUrl = 'https://10.0.2.2:7999/api'; // Android emulator
  static const storage = FlutterSecureStorage();

  static http.Client createHttpClient() {
    final ioClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(ioClient);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  static Future<void> saveToken(String token) async {
    await storage.write(key: 'jwt_token', value: token);
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
        final responseData = jsonDecode(response.body);
        await saveToken(responseData['token']);
        return responseData;
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

  static Future<List<Package>> getPackages() async {
    final client = createHttpClient();
    final token = await getToken();

    if (token == null) {
      throw Exception('No JWT token found');
    }

    try {
      final response = await client.get(
        Uri.parse('$baseUrl/Package/get-all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      print('Request URL: ${Uri.parse('$baseUrl/Package/get-all')}');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        return data.map((json) => Package.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load packages');
    } finally {
      client.close();
    }
  }
}

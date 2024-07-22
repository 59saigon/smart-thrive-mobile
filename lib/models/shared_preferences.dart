import 'package:shared_preferences/shared_preferences.dart';

// Lưu trữ email khi người dùng đăng nhập hoặc trong màn hình SettingsScreen
Future<void> saveUserEmail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_email', email);
}

// Lấy email của người dùng từ shared_preferences
Future<String?> getUserEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_email');
}

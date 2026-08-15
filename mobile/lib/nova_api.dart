import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class NovaApi {
  static const String baseUrl = AppConfig.backendUrl;

  static Future<String> sendMessage(String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );

    final data = jsonDecode(response.body);
    return data['reply'];
  }
}

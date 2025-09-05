
import 'dart:convert';
import 'package:http/http.dart' as http;


class AppApi {

  /// GET Method
  static Future<dynamic> getData(String endpoint) async {
    final url = Uri.parse(endpoint);
    print("Fetching: $url"); // 🔍 debug URL
    try {
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });

      print("Status code: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("GET failed: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("GET error: $e");
    }
  }



}

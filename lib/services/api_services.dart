import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:3000/api";

  static String token = "";

  static Future<dynamic> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return jsonDecode(response.body);
  }

  static Future<dynamic> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getBuku() async {
    final response = await http.get(Uri.parse("$baseUrl/buku"));

    return jsonDecode(response.body);
  }

  static Future<dynamic> tambahBuku(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/buku"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> updateBuku(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse("$baseUrl/buku/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> deleteBuku(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/buku/$id"));
    return jsonDecode(response.body);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient with ChangeNotifier {
  static const String deafaultUri = "https://api.coingecko.com/api/v3/coins/smooth-love-potion";
  var dio = Dio();

  Future<Map<String, dynamic>> post(String path, Map data) async {
    final response = await dio.post(
      "${deafaultUri}${path}",
      data: data,
    );
    return response.data["data"];
  }

  Future<Map<String, dynamic>> get() async {
    final response = await dio.get("${deafaultUri}");
    return response.data;
  }

  Future<Map<String, dynamic>> patch(String path) async {
    final response = await dio.patch("${deafaultUri}${path}");
    return response.data;
  }
}

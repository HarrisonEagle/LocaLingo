import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class APIClient {
  final API_URL =
      "${const String.fromEnvironment('SERVER_HOST', defaultValue: 'http://localhost:8000')}/api/v1";

  Future<Response<dynamic>> get(String endpoint) async {
    final response = await Dio().get('$API_URL/$endpoint',
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response;
  }

  Future<Response<dynamic>> post(
      String endpoint, Map<String, dynamic> jsonData) async {
    final response = await Dio().post('$API_URL/$endpoint',
        data: jsonData,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response;
  }

  Future<Response<dynamic>> put(
      String endpoint, Map<String, dynamic> jsonData) async {
    final data = FormData.fromMap(jsonData);
    final response = await Dio().put('$API_URL/$endpoint',
        data: jsonData,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response;
  }

  Future<Response<dynamic>> delete(String endpoint) async {
    final response = await Dio().delete('$API_URL/$endpoint',
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:app_with_online_api/get_users_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataProvider with ChangeNotifier {
  ResponseData responseData = ResponseData();
  bool isLoading = false;

  getData() async {
    isLoading = true;
    responseData = await getAllMyData();
    isLoading = false;
    notifyListeners();
  }

  Future<ResponseData> getAllMyData() async {
    try {
      final response = await http.get(Uri.parse("https://reqres.in/api/users"));
      final item = json.decode(response.body);
      responseData = ResponseData.fromJson(item);
      notifyListeners();

    } catch (e) {
      log(e.toString());
    }
    return responseData;
  }
}

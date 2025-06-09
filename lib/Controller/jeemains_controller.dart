import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Model/jee_mains_api.dart';

class JeeMainsController extends ChangeNotifier {
  final dio = Dio();
  List<JeeMainsApi> _jeeMainsData = [];

  List<JeeMainsApi> get jeeMainsUserData => _jeeMainsData;

  Future<void> getJeeMainsAPIData() async {
    final response = await dio.get(
      "https://mapi.trycatchtech.com/v3/twelfth_question_papers/year_list?category=mains",
    );

    if (response.statusCode == 200 && response.data != null) {
      _jeeMainsData = JeeMainsApi.jeeMainsApiData(response.data);
      notifyListeners();
      debugPrint(null);
    } else {
      debugPrint("Failed to load data. Status code: ${response.statusCode}");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/jee_advanced_api.dart';

class JeeAdvancedController extends ChangeNotifier {
  final dio = Dio();
  List<JeeAdvancedApi> _jeeAdvancedData = [];

  List<JeeAdvancedApi> get jeeAdvancedUserData => _jeeAdvancedData;

  Future<void> getJeeAdvancedAPIData() async {
    final response = await dio.get(
      "https://mapi.trycatchtech.com/v3/twelfth_question_papers/year_list?category=mains",
    );

    if (response.statusCode == 200 && response.data != null) {
      _jeeAdvancedData = JeeAdvancedApi.jeeAdvancedApiData(response.data);
      notifyListeners();
      debugPrint(null);
    } else {
      debugPrint("Failed to load data. Status code: ${response.statusCode}");
    }
  }
}

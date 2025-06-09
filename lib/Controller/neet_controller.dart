import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Model/neet_model.dart';

class NeetController extends ChangeNotifier {
  final dio = Dio();
  List<NeetApi> _neetData = [];

  List<NeetApi> get neetData => _neetData;

  Future<void> neetApiData() async {
    final response = await dio.get(
      "https://mapi.trycatchtech.com/v3/twelfth_question_papers/year_list?category=neet",
    );

    if (response.statusCode == 200 && response.data != null) {
      _neetData = NeetApi.neetApiData(response.data);
      notifyListeners();
      debugPrint(null);
    } else {
      debugPrint("Failed to load data. Status code: ${response.statusCode}");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/mh_cet_model.dart';

class MhCetController extends ChangeNotifier {
  final dio = Dio();
  List<MhCetApi> _mhCetData = [];

  List<MhCetApi> get mhCetData => _mhCetData;

  Future<void> mhCetAPIData() async {
    final response = await dio.get(
      "https://mapi.trycatchtech.com/v3/twelfth_question_papers/year_list?category=mhcet",
    );

    if (response.statusCode == 200 && response.data != null) {
      _mhCetData = MhCetApi.mhCetApiData(response.data);
      notifyListeners();
      debugPrint(null);
    } else {
      debugPrint("Failed to load data. Status code: ${response.statusCode}");
    }
  }
}

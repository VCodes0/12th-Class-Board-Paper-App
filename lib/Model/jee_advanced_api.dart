import 'dart:convert';

class JeeAdvancedApi {
  String? id;
  String? year;
  String? file;

  JeeAdvancedApi({this.id, this.year, this.file});

  JeeAdvancedApi.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    year = json["year"];
    file = json["file"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["year"] = year;
    _data["file"] = file;
    return _data;
  }

  static List<JeeAdvancedApi> jeeAdvancedApiData(String data) {
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => JeeAdvancedApi.fromJson(item)).toList();
  }
}

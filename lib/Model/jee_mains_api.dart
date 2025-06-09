import 'dart:convert';

class JeeMainsApi {
  String? id;
  String? year;
  String? file;

  JeeMainsApi({this.id, this.year, this.file});

  JeeMainsApi.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    year = json["year"];
    file = json["file"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["year"] = year;
    data["file"] = file;
    return data;
  }

  static List<JeeMainsApi> jeeMainsApiData(String data) {
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => JeeMainsApi.fromJson(item)).toList();
  }
}

import 'dart:convert';

class NeetApi {
  String? id;
  String? year;
  String? file;

  NeetApi({this.id, this.year, this.file});

  NeetApi.fromJson(Map<String, dynamic> json) {
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

  static List<NeetApi> neetApiData(String data) {
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => NeetApi.fromJson(item)).toList();
  }
}

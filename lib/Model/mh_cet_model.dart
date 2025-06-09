import 'dart:convert';

class MhCetApi {
  String? id;
  String? year;
  String? file;

  MhCetApi({this.id, this.year, this.file});

  MhCetApi.fromJson(Map<String, dynamic> json) {
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

  static List<MhCetApi> mhCetApiData(String data) {
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => MhCetApi.fromJson(item)).toList();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quranwise/export.dart';

class ApiService {
  String baseUrl = "https://equran.id/api";

  Future getSurah() async {
    var url = Uri.parse('$baseUrl/surat');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      final data = json.map((e) => SurahModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception();
    }
  }

  Future getDetailSurah({required String id}) async {
    var url = Uri.parse('$baseUrl/surat/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      print(response.body);
      throw Exception();
    }
  }
}

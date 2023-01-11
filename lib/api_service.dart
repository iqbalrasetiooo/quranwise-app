import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quranwise/models/detail_surah_model.dart';
import 'package:quranwise/models/surah_model.dart';

class ApiService {
  String baseUrl = "https://equran.id/api";

  Future<List<SurahModel>> getSurah() async {
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

  Future<List<DetailSurahModel>> getDetailSurah(String id) async {
    var url = Uri.parse('$baseUrl/surat/{$id}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      final data = json.map((e) => DetailSurahModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception();
    }
  }
}

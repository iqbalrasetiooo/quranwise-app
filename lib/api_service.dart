import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quranwise/models/quran_model.dart';

class ApiService {
  String baseUrl = "https://equran.id/api";

  Future<List<QuranModel>> getSurah() async {
    var url = Uri.parse('$baseUrl/surat');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      final data = json.map((e) => QuranModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception();
    }
  }
}

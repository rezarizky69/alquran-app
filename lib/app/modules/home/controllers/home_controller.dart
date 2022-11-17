import 'dart:convert';

import 'package:alquran_app/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isDarkMode = false.obs;

  Future<List<Surah>> getAllSurah() async {
    Uri uri = Uri.parse('https://api.quran.gading.dev/surah');

    var resp = await http.get(uri);

    List? respSurah = (json.decode(resp.body) as Map<String, dynamic>)['data'];

    if (respSurah == null || respSurah.isEmpty) {
      return [];
    } else {
      return respSurah.map((e) => Surah.fromJson(e)).toList();
    }
  }
}

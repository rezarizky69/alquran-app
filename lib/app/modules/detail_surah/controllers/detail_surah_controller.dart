import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri uri = Uri.parse('https://api.quran.gading.dev/surah/$id');

    var resp = await http.get(uri);

    Map<String, dynamic> respDetailSurah =
        (json.decode(resp.body) as Map<String, dynamic>)['data'];

    return DetailSurah.fromJson(respDetailSurah);
  }
}

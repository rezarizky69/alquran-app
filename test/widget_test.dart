import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_ayat.dart';
import 'package:http/http.dart' as http;

void main() async {
  var res =
      await http.get(Uri.parse("https://api.quran.gading.dev/surah/108/1"));

  Map<String, dynamic> data = json.decode(res.body)['data'];

  DetailAyat detailAyat = DetailAyat.fromJson(data);

  print(detailAyat.translation?.en);
  print(detailAyat.translation?.id);
}

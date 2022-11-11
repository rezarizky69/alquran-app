import 'package:alquran_app/app/data/models/surah.dart';
import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              Surah itemSurah = snapshot.data![index];
              return ListTile(
                onTap: (() {
                  Get.toNamed(Routes.DETAIL_SURAH, arguments: itemSurah);
                }),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "${itemSurah.number}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(itemSurah.name?.transliteration?.id ?? 'Error...'),
                subtitle: Text(
                    '${itemSurah.numberOfVerses} Ayat | ${itemSurah.revelation?.id ?? 'Error...'}'),
                trailing: Text(itemSurah.name?.short ?? 'Error...'),
              );
            }),
          );
        },
      ),
    );
  }
}

import 'package:alquran_app/app/constants/theme.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SEARCH_PAGE);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum,",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      GREEN1,
                      GREEN2,
                    ],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Get.toNamed(Routes.LAST_READ);
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -55,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "assets/images/Al_Quran_Illustration-removebg-preview.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir Dibaca",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Al-Fatihah",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Juz 1 | Ayat 5",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                indicatorColor: GREEN1,
                labelColor: GREEN1,
                unselectedLabelColor: Get.isDarkMode ? Colors.white : BLACK1,
                labelStyle: TextStyle(
                  fontWeight: Get.isDarkMode ? null : FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "Bookmark",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: itemSurah);
                              }),
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Text(
                                  "${itemSurah.number}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                itemSurah.name?.transliteration?.id ??
                                    'Error...',
                                style: TextStyle(color: GREEN1),
                              ),
                              subtitle: Text(
                                '${itemSurah.numberOfVerses} Ayat | ${itemSurah.revelation?.id ?? 'Error...'}',
                                style: TextStyle(color: GREEN1),
                              ),
                              trailing:
                                  Text(itemSurah.name?.short ?? 'Error...'),
                            );
                          }),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 30,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            "Juz ${index + 1}",
                            style: TextStyle(color: GREEN1),
                          ),
                        );
                      }),
                    ),
                    Center(
                      child: Text("Coming soon"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

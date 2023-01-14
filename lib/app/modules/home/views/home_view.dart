import 'package:dictionary/app/modules/home/category_model.dart';
import 'package:dictionary/app/modules/home/views/category_view.dart';
import 'package:dictionary/app/modules/home/views/word_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

final Uri _url = Uri.parse('https://dictionary.rfhindi.com/');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = controller.isDataProcessing.value;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Pawari Dictionary'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: _launchUrl,
              ),
            )
          ],
        ),
        drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff9d0000),
              ),
              child: Center(
                  child: CircleAvatar(
                child: Image(
                  image: AssetImage(
                    'images/Pawari_dictionary_logo.png',
                  ),
                  height: 100,
                ),
                backgroundColor: Color(0xff9d0000),
                radius: 120.0,
              )),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text(
                'About Us',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: const Text(
                'Facebook',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.youtube_searched_for),
              title: const Text(
                'Youtube',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
        body:   FutureBuilder<void>(
        future: _initGoogleMobileAds(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return Obx(() {
        return  Container(
            padding: EdgeInsets.only(top: 15, left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextField(
                          controller: controller.titleEditingController,
                          decoration: InputDecoration(
                              hintText: 'Search Keyword ',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0,
                                      style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(4)),
                              contentPadding:
                                  EdgeInsets.only(left: 10, top: 5, bottom: 5)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.searchKey(
                              controller.titleEditingController.text);
                        },
                        child: controller.isDataProcessing.value
                            ? Icon(Icons.search)
                            : Icon(Icons.search),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.mic),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 55,
                    child:
                        Expanded(child: CategoryList(controller: controller))),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: WordList(controller: controller)),
              ],
            ),
          );
        
         },
      );
        
        }));
  }
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}

class CategoryList extends StatelessWidget {
  final HomeController controller;
  const CategoryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isCategoryProcessing.value == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: (() {
                  Get.to(CategoryView(),
                      arguments: controller.categories[index].id);
                }),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '${controller.categories[index].name}',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          });
    }
  }
}

class WordList extends StatelessWidget {
  final HomeController controller;
  const WordList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isDataProcessing.value == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: ListView.builder(
            itemCount: controller.lstTask.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.lstTask[index].pawari}',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${controller.lstTask[index].hindi}',
                            style: TextStyle(fontSize: 19),
                          ),
                          Text(
                            '${controller.lstTask[index].english}',
                            style: TextStyle(fontSize: 19),
                          ),
                        ]),
                  ),
                  onTap: (() {
                    controller.assignSingleWOrd(index);
                    Get.to(WordView(controller: controller));
                  }),
                ),
              );
            }),
      );
    }
  }
}

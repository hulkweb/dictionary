import 'dart:convert';

import 'package:dictionary/ad_helper.dart';
import 'package:dictionary/app/controllers/category_details_controller.dart';
import 'package:dictionary/app/modules/home/category_detail_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<CategoryDetail> fetchAlbum(int id) async {
  final response = await http
      .get(Uri.parse('https://dictionary.rfhindi.com/api/categories/${id}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CategoryDetail.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  BannerAd? _bannerAd;
  final int id = Get.arguments;
  late Future<CategoryDetail> futureAlbum;
  @override
  initState() {
    super.initState();
    futureAlbum = fetchAlbum(id);
   BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Details Of Category'),
      ),
      body: FutureBuilder<CategoryDetail>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(color: Colors.blue[50]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data?.data?[index].title}',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${snapshot.data?.data?[index].details}',
                                  style: TextStyle(fontSize: 19),
                                ),
                                if (_bannerAd != null)
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: _bannerAd!.size.width.toDouble(),
                                      height: _bannerAd!.size.height.toDouble(),
                                      child: AdWidget(ad: _bannerAd!),
                                    ),
                                  ),
                              ]),
                        ),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Center(child: const CircularProgressIndicator());
          }),
    );
  }

}

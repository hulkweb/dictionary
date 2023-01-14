import 'package:dictionary/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordView extends StatelessWidget {
  final HomeController controller;
  const WordView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text('${controller.lstTask[controller.singleWord.value].pawari}'),
        
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("पंवारी शब्द - ",  style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text(
                          '${controller.lstTask[controller.singleWord.value].pawari}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("हिंदी अर्थ - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text(
                          '${controller.lstTask[controller.singleWord.value].hindi}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("अंग्रेजी अर्थ - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text(
                          '${controller.lstTask[controller.singleWord.value].english}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("शब्द का प्रकार - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text(
                          '${controller.lstTask[controller.singleWord.value].wordType1}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400))),
                ],
              ),
            ),

            // card start
            SizedBox(height: 10),
            Container(
               width: 300,
              decoration: BoxDecoration(color: Colors.blue[50]),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("पंवारी वाक्य - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500)),
                  Text(
                      '${controller.lstTask[controller.singleWord.value].pawariSentence}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
               width: 300,
              decoration: BoxDecoration(color: Colors.blue[50]),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("हिंदी वाक्य - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500)),
                  Text(
                      '${controller.lstTask[controller.singleWord.value].hindiSentence}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
               width: 300,
              decoration: BoxDecoration(color: Colors.blue[50]),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("अंग्रेजी वाक्य - ",style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500)),
                  Text(
                      '${controller.lstTask[controller.singleWord.value].englishSentence}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              decoration: BoxDecoration(color: Colors.blue[50]),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '"${controller.lstTask[controller.singleWord.value].pawari}" का विवरण - ',style:TextStyle(fontFamily: "poppins",fontSize: 22,fontWeight: FontWeight.w500)),
                  controller.lstTask[controller.singleWord.value].details=='null'? Text(
                      '${controller.lstTask[controller.singleWord.value].details}',style:TextStyle(fontFamily: "poppins",fontSize: 19,fontWeight: FontWeight.w400)):Text(''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

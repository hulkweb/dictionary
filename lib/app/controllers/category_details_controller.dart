import 'package:dictionary/app/modules/home/providers/category_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  //TODO: Implement CategoryDetailsController

  var isCategoryDetailProcessing = false.obs;

  var categoryDetails = List<dynamic>.empty(growable: true).obs;

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  void getCategoryDetails(var id) {
    print(id);
    try {
      isCategoryDetailProcessing(true);
      CategoryDetailProvider().getCategoryDetails(id).then((resp) {
        isCategoryDetailProcessing(false);
        categoryDetails.assignAll(resp.data);
      }, onError: (err) {
        isCategoryDetailProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isCategoryDetailProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
}

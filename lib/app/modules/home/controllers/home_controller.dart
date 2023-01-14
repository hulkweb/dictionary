import 'package:dictionary/app/modules/home/providers/category_detail_provider.dart';
import 'package:dictionary/app/modules/home/providers/category_provider.dart';
import 'package:dictionary/app/modules/home/providers/model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var lstTask = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  var isDataProcessing = false.obs;
  var isCategoryProcessing = false.obs;
  var isCategoryDetailProcessing = false.obs;

  var categories = List<dynamic>.empty(growable: true).obs;
  var categoryDetails = List<dynamic>.empty(growable: true).obs;
  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  late TextEditingController titleEditingController,
      descriptionEditingController;
  var singleWord = 0.obs;
  var isProcessing = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    getTask(page);
    getCategories(page);
    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
  }

  void getTask(var page) {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ModelProvider().getTask(page).then((resp) {
        isDataProcessing(false);
        lstTask.addAll(resp.data);
        print(lstTask.length);
      }, onError: (err) {
        isDataProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // common snack bar
  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  void assignSingleWOrd(var index) {
    singleWord(index);
  }

  void increment() => count.value++;

  void searchKey(String Keyword) {
    singleWord(0);
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ModelProvider().getSearchedTask(Keyword).then((resp) {
        isDataProcessing(false);
        lstTask.assignAll(resp.data);
        print(lstTask.length);
      }, onError: (err) {
        isDataProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void getCategories(var page) {
    try {
      isCategoryProcessing(true);
      CategoryProvider().getCategory(page).then((resp) {
        isCategoryProcessing(false);
        categories.assignAll(resp.data);
     
      }, onError: (err) {
        isCategoryProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isCategoryProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
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

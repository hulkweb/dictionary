import 'dart:convert';

import 'package:get/get.dart';

import '../category_model.dart';

class CategoryProvider extends GetConnect {
 Future<dynamic> getCategory(var page) async {
    try {
      final response =
          await get("https://dictionary.rfhindi.com/api/categories?page=1");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return Category.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

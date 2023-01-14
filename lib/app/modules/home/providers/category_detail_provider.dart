import 'dart:convert';

import 'package:get/get.dart';

import '../category_detail_model.dart';

class CategoryDetailProvider extends GetConnect {
 Future<dynamic> getCategoryDetails(var id) async {
    try {
      final response =
          await get("https://dictionary.rfhindi.com/api/categories/$id");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return CategoryDetail.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

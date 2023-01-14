import 'dart:convert';

import 'package:get/get.dart';

import '../model_model.dart';

class ModelProvider extends GetConnect {

  Future<dynamic> getTask(var page) async {
    try {
      final response =
          await get("https://dictionary.rfhindi.com/api/words?page=1");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return Model.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

Future<dynamic> getSearchedTask(var keyword) async {

    try {
      final response =
          await post("https://dictionary.rfhindi.com/api/word_search",{"keyword":keyword,"type":""});
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return Model.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

}

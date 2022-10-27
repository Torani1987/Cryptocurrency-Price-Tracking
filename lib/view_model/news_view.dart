import 'dart:convert';

import 'package:crypto_app_pi/model/news.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsViewModel extends GetxController {
  getData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b9ef3df1048645ceab10cb5e8494634e");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('cant find any data in here', e.toString());
      }
    }
  }
}

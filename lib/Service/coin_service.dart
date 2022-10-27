import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crypto_app_pi/model/coin.dart';

class FetchCoin {
  var data = [];
  List<Coin> results = [];
  String coinUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=gecko_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C7d%2C14d%2C30d';
  Future<List<Coin>> getcoinList({String? query}) async {
    final response = await http.get(Uri.parse(coinUrl));
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => Coin.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.name!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print('Api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

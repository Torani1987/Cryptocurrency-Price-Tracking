import 'package:crypto_app_pi/model/coin.dart';
import 'package:crypto_app_pi/page/constants.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app_pi/Service/coin_service.dart';
import 'package:crypto_app_pi/model/coin.dart';
import 'package:intl/intl.dart';

import '../widget/chart.dart';
import 'detail_screen.dart';

class SearchCoin extends SearchDelegate {
  @override
  FetchCoin _Coinlist = FetchCoin();

  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  checkPercentage(data, int index) {
    return data[index]
            .priceChangePercentage7DInCurrency
            .toString()
            .contains('-')
        ? kRedColor
        : kGreenColor;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  final formatter = NumberFormat.decimalPattern();
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<List<Coin>>(
        future: _Coinlist.getcoinList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data;
          return ListView.builder(
              itemCount: data!.length,
              itemBuilder: ((context, index) {
                return Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 110, top: 20),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 60,
                          child: Chart(
                            blurRadius: 30,
                            spreadRadius: -10,
                            data: data[index],
                          )),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      data[index].name!.length >= 13
                          ? '${data[index].name!.substring(0, 13)}...'
                          : data[index].name!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].image!),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${formatter.format(data[index].currentPrice)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    coin: data[index],
                                  )));
                    },
                    subtitle: Text(data[index].symbol!.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ]);
              }));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Text("Search Your Coin"));
  }
}

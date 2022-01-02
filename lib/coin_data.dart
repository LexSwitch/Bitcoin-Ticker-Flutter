import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final baseURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

  Future fetchRate(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = '$baseURL/$crypto$selectedCurrency';
      http.Response response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['last'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
        print(cryptoPrices);
      } else {
        print(response.statusCode);
        print("Error. Nothing dey");
      }
    }
    return cryptoPrices;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/news.dart';

class ApiService {
  String UrlForApi(optionUrl) {
    switch (optionUrl) {
      case 1:
        // All articles about Tesla from the last month, sorted by recent first
        return 'https://newsapi.org/v2/everything?q=tesla&from=2021-03-07&sortBy=publishedAt&apiKey=7309eda6a33f407db7ba4d4faf0b0d5d';
      case 2:
        // Top business headlines in the US right now
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7309eda6a33f407db7ba4d4faf0b0d5d';
      case 3:
        //All articles mentioning Apple from yesterday, sorted by popular publishers first
        return 'https://newsapi.org/v2/everything?q=apple&from=2021-03-07&to=2021-02-12&sortBy=popularity&apiKey=7309eda6a33f407db7ba4d4faf0b0d5d';
      case 4:
        //Top headlines from TechCrunch right now
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7309eda6a33f407db7ba4d4faf0b0d5d';
      case 5:
        //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=7309eda6a33f407db7ba4d4faf0b0d5d';
    }
  }

  Getdio({@required int optionUrl}) async {
    print('GetDio');

    var dio = Dio();

    Response response = await dio.get(UrlForApi(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      print('algo ha salido mal');
    }
  }
}

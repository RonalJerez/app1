class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;
  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.fromjson(Map<String, dynamic> map) {
    var mapArticles = map['articles'] as List;

    status = map['status'];
    totalResults = map['totalResults'];
    articlesList =
        mapArticles.map((json) => News.fromjson(json)).cast<News>().toList();
  }
}

class News {
  Source source;
  String urlToImage;
  String tittle;
  String url;
  String author;
  String publishedAt;
  String dateTime;
  String content;
  String description;
  String styles;

  News({
    this.source,
    this.urlToImage,
    this.tittle,
    this.url,
    this.author,
    this.publishedAt,
    this.dateTime,
    this.content,
    this.description,
    this.styles,
  });

  News.fromjson(Map<String, dynamic> map) {
    source = Source.fromjson(map['source']);
    author = map['auhtor'];
    tittle = map['tittle'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAtt'];
    content = map['content'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  static fromjson(map) {}
}

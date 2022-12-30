import 'package:equatable/equatable.dart';
import 'package:new_app/features/news_feature/domain/entities/news_models/news_source_model.dart';

class NewsModel extends Equatable {
  NewSourceModel? newsSourceModel;
  String? author;
  String? title;
  String? describtion;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    required this.newsSourceModel,
    required this.author,
    required this.title,
    required this.describtion,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  NewsModel.fromJSON(Map<String, dynamic> json) {
    newsSourceModel = NewSourceModel.fromJSON(json['source']);
    author = json['author'];
    title = json['title'];
    describtion = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        newsSourceModel,
        author,
        title,
        describtion,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}

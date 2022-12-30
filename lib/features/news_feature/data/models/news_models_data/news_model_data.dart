import 'package:equatable/equatable.dart';
import 'package:new_app/features/news_feature/domain/entities/news_models/news_model.dart';

class NewsModelData extends Equatable {
  NewsModel newsModel;
  NewsModelData({required this.newsModel});

  String get auther => newsModel.author!;
  String get title => newsModel.title!;
  String get describtion => newsModel.describtion!;
  String get url => newsModel.url!;
  String get urlToImage => newsModel.urlToImage!;
  String get publishedAt => newsModel.publishedAt!;
  String get content => newsModel.content!;
  int? get sourceId => newsModel.newsSourceModel?.id;
  String? get sourceName => newsModel.newsSourceModel?.name;

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

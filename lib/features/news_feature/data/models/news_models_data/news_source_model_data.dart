import 'package:equatable/equatable.dart';

import '../../../domain/entities/news_models/news_source_model.dart';

class NewsSourceModelData extends Equatable {
  final NewSourceModel newsSourceModel;
  const NewsSourceModelData({required this.newsSourceModel});

  int? get id => newsSourceModel.id;
  String? get name => newsSourceModel.name;
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [newsSourceModel];
}

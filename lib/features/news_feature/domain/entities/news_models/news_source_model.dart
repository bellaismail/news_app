import 'package:equatable/equatable.dart';

class NewSourceModel extends Equatable {
  int? id;
  String? name;
  NewSourceModel({this.id, required this.name});
  NewSourceModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}

import 'package:hs/models/AirDeepModel.dart';

class AirModel{
  String id;
  Map<String, dynamic> fields;

  AirModel({
    this.fields,
    this.id
  });

  factory AirModel.toJson(Map<String, dynamic> json) =>
  AirModel(
    id: json['id'],
    fields: json['fields'].map<AirDeepModel>((e) =>
    AirDeepModel.toJson(e)).toList()
  );
}
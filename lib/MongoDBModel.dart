import 'dart:convert';
//import 'dart:html';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));
String mongoDbModeltoJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel{
  MongoDbModel({
    required this.id,
    required this.AssetName,
    required this.AssetID,
    required this.workType,
    required this.schemeUsed,
    required this.AssetLocation,
    required this.workCode,
    required this.workLocation,
    required this.workName,
    required this.yearofComp,



  });

  ObjectId id;
  String AssetName;
  String AssetID;
  String workType;
  String schemeUsed;
  String AssetLocation;
  String yearofComp;
  String workCode;
  String workName;
  String workLocation;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    id: json["_id"],
    AssetName: json["AssetName"],
    AssetID: json["lastName"],
    workType: json["workType"],
    schemeUsed: json["schemeUsed"],
    AssetLocation: json["AssetLocation"],
    yearofComp: json["yearofComp"],
    workCode: json["workCode"],
    workName: json["workName"],
    workLocation: json["workLocation"],
  );

  Map<String, dynamic> toJson() => {
    "_id" : id,
    "AssetName" : AssetName,
    "AssetID" : AssetID,
    "workType" : workType,
    "schemeUsed" : schemeUsed,
    "AssetLocation" : workType,
    "yearofComp" : yearofComp,
    "workCode" : workCode,
    "workName" : workName,
    "workLocation" : workLocation,
  };
}


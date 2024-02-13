import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class MyJsonConverter implements JsonConverter<DateTime, Timestamp> {
  const MyJsonConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime dateTime) => Timestamp.fromDate(dateTime);
}

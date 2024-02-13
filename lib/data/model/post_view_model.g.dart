// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostViewModel _$PostViewModelFromJson(Map<String, dynamic> json) =>
    PostViewModel(
      userId: json['userId'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      date: const MyJsonConverter().fromJson(json['date'] as Timestamp),
      location: json['location'] as String,
      like: (json['like'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostViewModelToJson(PostViewModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'userId': instance.userId,
      'date': const MyJsonConverter().toJson(instance.date),
      'like': instance.like,
    };

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
      location: json['location'] as String,
      like: json['like'] as int,
    );

Map<String, dynamic> _$PostViewModelToJson(PostViewModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'userId': instance.userId,
      'like': instance.like,
    };

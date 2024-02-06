// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostViewModel _$PostViewModelFromJson(Map<String, dynamic> json) =>
    PostViewModel(
      description: json['description'] as String,
      image: json['image'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      userName: json['userName'] as String,
      location: json['location'] as String,
      like: json['like'] as int,
    );

Map<String, dynamic> _$PostViewModelToJson(PostViewModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'userName': instance.userName,
      'location': instance.location,
      'like': instance.like,
    };

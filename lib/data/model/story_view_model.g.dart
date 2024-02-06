// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryViewModel _$StoryViewModelFromJson(Map<String, dynamic> json) =>
    StoryViewModel(
      image: json['image'] as String,
      userImage: json['userImage'] as String,
      userName: json['userName'] as String,
      seen: json['seen'] as bool,
    );

Map<String, dynamic> _$StoryViewModelToJson(StoryViewModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'userImage': instance.userImage,
      'userName': instance.userName,
      'seen': instance.seen,
    };

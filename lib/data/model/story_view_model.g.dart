// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryViewModel _$StoryViewModelFromJson(Map<String, dynamic> json) =>
    StoryViewModel(
      image: json['image'] as String,
      userId: json['userId'] as String,
      seen: json['seen'] as bool,
    );

Map<String, dynamic> _$StoryViewModelToJson(StoryViewModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'userId': instance.userId,
      'seen': instance.seen,
    };

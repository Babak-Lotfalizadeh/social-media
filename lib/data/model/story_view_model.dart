import 'package:json_annotation/json_annotation.dart';

part 'story_view_model.g.dart';

@JsonSerializable()
class StoryViewModel {
  String image;
  String userImage;
  String userName;
  bool seen;

  StoryViewModel({
    required this.image,
    required this.userImage,
    required this.userName,
    required this.seen,
  });

  factory StoryViewModel.fromJson(Map<String, dynamic> json) =>
      _$StoryViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryViewModelToJson(this);
}

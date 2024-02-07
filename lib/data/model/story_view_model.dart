import 'package:json_annotation/json_annotation.dart';

part 'story_view_model.g.dart';

@JsonSerializable()
class StoryViewModel {
  @JsonKey(includeFromJson: false) late String id;
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

  void setId(String newId){
    id = newId;
  }

  void setSeen(bool newValue) {
    seen = newValue;
  }

  factory StoryViewModel.fromJson(Map<String, dynamic> json) =>
      _$StoryViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryViewModelToJson(this);
}

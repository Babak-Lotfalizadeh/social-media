import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/data/model/user_view_model.dart';

part 'story_view_model.g.dart';

@JsonSerializable()
class StoryViewModel {
  @JsonKey(includeFromJson: false) late String id;
  @JsonKey(includeFromJson: false) UserViewModel? user;
  String image;
  String userId;
  bool seen;

  StoryViewModel({
    required this.image,
    required this.userId,
    required this.seen,
  });

  void setUser(List<UserViewModel>? allUsers){
    final matchUsers = allUsers?.where((element) => element.userId == userId);
    if(matchUsers?.isNotEmpty == true){
      user = matchUsers?.first;
    }
  }

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

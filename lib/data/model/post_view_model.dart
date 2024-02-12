import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/data/model/user_view_model.dart';

part 'post_view_model.g.dart';

@JsonSerializable()
class PostViewModel {
  @JsonKey(includeFromJson: false) late String id;
  @JsonKey(includeFromJson: false) UserViewModel? user;
  String description;
  String image;
  String location;
  String userId;
  int like;

  PostViewModel({
    required this.userId,
    required this.description,
    required this.image,
    required this.location,
    required this.like,
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

  factory PostViewModel.fromJson(Map<String, dynamic> json) =>
      _$PostViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostViewModelToJson(this);
}

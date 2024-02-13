import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/data/convertor/json_convertor.dart';
import 'package:social_media/data/model/user_view_model.dart';

part 'post_view_model.g.dart';

@JsonSerializable()
class PostViewModel {
  @JsonKey(includeFromJson: false) var myId = 'b0dcTUTIWqL8QNX3rO5Z';//todo
  @JsonKey(includeFromJson: false) late String id;
  @JsonKey(includeFromJson: false) UserViewModel? user;
  String description;
  String image;
  String location;
  String userId;
  @MyJsonConverter()
  DateTime date;
  List<String> like;

  PostViewModel({
    required this.userId,
    required this.description,
    required this.image,
    required this.date,
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

  bool isLikeByMe() {
    return like.any((element) => element == myId);
  }

  void toggleLikeButton() {
    var likeByMe = isLikeByMe();
    if(likeByMe) {
      like.removeWhere((element) => element ==  myId);
    } else {
      like.add(myId);
    }
  }
}

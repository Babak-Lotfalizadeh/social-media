import 'package:json_annotation/json_annotation.dart';

part 'post_view_model.g.dart';

@JsonSerializable()
class PostViewModel {
  String description;
  String image;
  String userId;
  String userImage;
  String userName;
  String location;
  int like;

  PostViewModel({
    required this.description,
    required this.image,
    required this.userId,
    required this.userImage,
    required this.userName,
    required this.location,
    required this.like,
  });

  factory PostViewModel.fromJson(Map<String, dynamic> json) =>
      _$PostViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostViewModelToJson(this);
}

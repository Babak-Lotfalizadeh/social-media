import 'package:json_annotation/json_annotation.dart';

part 'user_view_model.g.dart';

@JsonSerializable()
class UserViewModel {
  @JsonKey(includeFromJson: false) late String userId;
  String userImage;
  String userName;

  UserViewModel({
    required this.userImage,
    required this.userName,
  });

  void setId(String newId) {
    userId = newId;
  }

  factory UserViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserViewModelToJson(this);
}

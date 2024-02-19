import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/data/model/user_view_model.dart';

class StoryViewModel {
  final UserViewModel? user;
  final String id;
  final bool seen;

  StoryViewModel({
    required this.id,
    required this.user,
    required this.seen,
  });


  factory StoryViewModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    List<UserViewModel>? allUsers,
  ) {
    final data = snapshot.data();
    final userId = data?['userId'];
    final matchUsers = allUsers?.where((element) => element.userId == userId);

    return StoryViewModel(
      user: matchUsers?.isNotEmpty == true ? matchUsers?.first : null,
      seen: data?['seen'] ?? false,
      id: snapshot.id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "userId": user?.userId,
    };
  }
}

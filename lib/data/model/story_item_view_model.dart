import 'package:cloud_firestore/cloud_firestore.dart';


class StoryItemViewModel {
  final String id;
  final String image;
  bool seen;
  DateTime date;

  StoryItemViewModel({
    required this.id,
    required this.image,
    required this.seen,
    required this.date,
  });


  void setSeen(bool newValue) {
    seen = newValue;
  }

  factory StoryItemViewModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return StoryItemViewModel(
      date: (data?['date'] as Timestamp).toDate(),
      image: data?['image'],
      seen: data?['seen'],
      id: snapshot.id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "image": image,
      "seen": seen,
      "date": date,
    };
  }
}

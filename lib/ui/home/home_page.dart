import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media/core/firebase/firestore_service.dart';
import 'package:social_media/ui/app_bar/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    GetIt.instance<FireStoreService>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
    );
  }
}

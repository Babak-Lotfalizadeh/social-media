import 'package:flutter/material.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/social_media_app.dart';

void main() async {
  await DIService.setup();
  runApp(const SocialMediaApp());
}
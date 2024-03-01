import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/add_post/bloc/add_post_bloc.dart';
import 'package:social_media/ui/add_post/bloc/add_post_event.dart';
import 'package:social_media/ui/add_post/widget/post_page_button.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/post_type.dart';

class EditPostPage extends StatefulWidget {
  final File image;
  final PostType postType;

  const EditPostPage({
    required this.postType,
    required this.image,
    super.key,
  });

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Image.file(
              widget.image,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: PostPageButton(
                iconData: Icons.cancel,
                onPressed: () => context.pop(),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(StaticSize.paddingNormal),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'description',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                          ),
                          controller: descriptionController,
                        ),
                      ),
                      PostPageButton(
                        onPressed: () {
                          context.read<AddPostBloc>().add(
                                AddPostEventCreateAPost(
                                  file: widget.image,
                                  description: descriptionController.text,
                                ),
                              );
                        },
                        iconData: Icons.send,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

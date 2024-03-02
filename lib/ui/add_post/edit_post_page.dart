import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/add_post/bloc/add_post_bloc.dart';
import 'package:social_media/ui/add_post/bloc/add_post_event.dart';
import 'package:social_media/ui/add_post/widget/post_page_button.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_event.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(StaticSize.paddingNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostPageButton(
                iconData: Icons.cancel,
                onPressed: () => context.pop(),
              ),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio:
                        widget.postType == PostType.post ? 4 / 3 : 9 / 16,
                    child: Image.file(
                      widget.image,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(StaticSize.paddingNormal),
                child: Row(
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: widget.postType == PostType.post,
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
                    ),
                    PostPageButton(
                      onPressed: () {
                        context.read<AddPostBloc>().add(
                              AddPostEventCreateAPost(
                                file: widget.image,
                                description: descriptionController.text,
                                postType: widget.postType,
                              ),
                            );
                        context.read<BottomNavigationBloc>().add(
                            BottomNavigationChangeValue(
                              newValue: 0,
                            ),
                        );
                        context.pop();
                      },
                      iconData: Icons.send,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

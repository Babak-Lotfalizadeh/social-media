import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/add_post/widget/post_page_button.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/post_type.dart';

class EditPostPage extends StatelessWidget {
  final File image;
  final PostType postType;

  const EditPostPage({
    required this.postType,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Image.file(
              image,
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
                        ),
                      ),
                      PostPageButton(
                        onPressed: () {},
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

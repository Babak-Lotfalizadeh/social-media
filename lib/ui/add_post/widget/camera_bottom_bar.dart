import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/add_post/widget/camera_shutter_button.dart';
import 'package:social_media/utils/post_type.dart';

class CameraBottomBar extends StatelessWidget {
  final PostType postType;
  final Function(PostType newItem) onChangePostType;
  final Function() onCameraSwitch;
  final Function() onCameraShot;
  final PageController pageController;

  const CameraBottomBar({
    required this.postType,
    required this.onChangePostType,
    required this.pageController,
    required this.onCameraShot,
    required this.onCameraSwitch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CameraShutterButton(
          onClick: onCameraShot,
        ),
        SizedBox(height: StaticSize.paddingLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Gallery",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(width: StaticSize.paddingLarge),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: PageView.builder(
                  controller: pageController,
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = PostType.values[index];

                    return GestureDetector(
                      onTap: () => onChangePostType(item),
                      child: Container(
                        padding: EdgeInsets.all(StaticSize.paddingNormal),
                        child: Center(
                          child: Text(
                            item.name.toUpperCase(),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: postType == item
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: PostType.values.length,
                ),
              ),
            ),
            SizedBox(width: StaticSize.paddingLarge),
            IconButton(
              onPressed: onCameraSwitch,
              icon: Icon(
                Icons.cameraswitch_outlined,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

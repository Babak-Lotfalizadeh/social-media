import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/data/model/user_view_model.dart';
import 'package:social_media/ui/home/widget/user_image.dart';
import 'package:social_media/ui/post/post_list_page.dart';
import 'package:social_media/ui/profile/widget/field_value_widget.dart';
import 'package:social_media/ui/public/my_button.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/export.dart';

class ProfilePageContainer extends StatelessWidget {
  final User? user;
  final Stream<UserViewModel?> userViewModel;
  final Stream<List<PostViewModel>> posts;

  const ProfilePageContainer({
    required this.user,
    required this.posts,
    required this.userViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return StreamBuilder(
      stream: posts,
      builder: (context, snapshotPosts) => StreamBuilder(
        stream: userViewModel,
        builder: (context, snapshotUser) {
          if (!snapshotUser.hasData) return const SizedBox.shrink();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(StaticSize.paddingLarge),
                child: Row(
                  children: [
                    Column(
                      children: [
                        UserImage(
                          imageAddress: snapshotUser.data?.userImage ?? '',
                          size: StaticSize.iconSizeLarge,
                        ),
                        SizedBox(height: StaticSize.paddingNormal),
                        Text(snapshotUser.data?.userName ?? ''),
                      ],
                    ),
                    Expanded(
                      child: FieldValueWidget(
                        value:
                            "${snapshotPosts.hasData ? (snapshotPosts.data?.length ?? 0) : 0}",
                        title: strings?.posts,
                      ),
                    ),
                    Expanded(
                      child: FieldValueWidget(
                        value: '0',
                        title: strings?.followers,
                      ),
                    ),
                    Expanded(
                      child: FieldValueWidget(
                        value: '0',
                        title: strings?.following,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: StaticSize.paddingNormal),
                  Expanded(
                    child: MyButton(
                      onPressed: () {},
                      title: strings?.editProfile,
                    ),
                  ),
                  SizedBox(width: StaticSize.paddingNormal),
                  Expanded(
                    child: MyButton(
                      title: strings?.shareProfile,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: StaticSize.paddingNormal),
                  MyButton(
                    onPressed: () {},
                    child: const Icon(Icons.person_add_outlined),
                  ),
                  SizedBox(width: StaticSize.paddingNormal),
                ],
              ),
              SizedBox(height: StaticSize.paddingLarge),
              if (snapshotPosts.hasData && snapshotPosts.data != null)
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshotPosts.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: StaticSize.paddingSmall,
                    mainAxisSpacing: StaticSize.paddingSmall,
                  ),
                  itemBuilder: (context, index) {
                    final item = snapshotPosts.data?[index];
                    if (item == null) return const SizedBox.shrink();
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          PostListPage(
                            posts: snapshotPosts.data,
                          ),
                        );
                      },
                      child: Image.network(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

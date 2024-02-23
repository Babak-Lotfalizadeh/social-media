import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/data/model/story_item_view_model.dart';
import 'package:social_media/data/model/story_view_model.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_event.dart';
import 'package:social_media/utils/context_extension.dart';

class StoryPreviewContent extends StatelessWidget {
  const StoryPreviewContent({
    required this.story,
    required this.data,
    super.key,
  });

  final List<StoryItemViewModel>? data;
  final StoryViewModel story;

  @override
  Widget build(BuildContext context) {
    late final pageController = PageController();
    late final count = data?.length ?? 0;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: count,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final isTheLastItem = index == (count - 1);
                context.read<StoryBloc>().add(
                      StoryEventSeen(
                        story: story,
                        storyItem: data?[index],
                        markStoryAsSeen: isTheLastItem,
                      ),
                    );
                if (isTheLastItem) {
                  context.pop();
                } else {
                  pageController.animateToPage(
                    ++index,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 300),
                  );
                }
              },
              child: Image.network(
                data?[index].image ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        SafeArea(
          child: SmoothPageIndicator(
            controller: pageController,
            count: count,
          ),
        ),
      ],
    );
  }
}

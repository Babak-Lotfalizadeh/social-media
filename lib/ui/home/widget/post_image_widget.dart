import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/post_view_model.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_event.dart';

class PostImageWidget extends StatefulWidget {
  final PostViewModel? postViewModel;

  const PostImageWidget({
    required this.postViewModel,
    super.key,
  });

  @override
  State<PostImageWidget> createState() => _PostImageWidgetState();
}

class _PostImageWidgetState extends State<PostImageWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..addListener(() {
    if(_controller.isCompleted){
      _controller.reverse();
    }
  });

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );



  @override
  Widget build(BuildContext context) {
    if (widget.postViewModel?.image != null) {
      return Expanded(
        child: GestureDetector(
          onDoubleTap: () {
            _controller.forward();
            context.read<HomeBloc>().add(
                  HomeEventLikeAPost(postViewModel: widget.postViewModel),
                );
          },
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Image.network(
                  widget.postViewModel?.image ?? '',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: constraints.maxHeight * 0.6,
                     ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_media/ui/add_post/bloc/add_post_bloc.dart';
import 'package:social_media/ui/add_post/bloc/add_post_state.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_event.dart';
import 'package:social_media/ui/home/bloc/home_state.dart';
import 'package:social_media/ui/profile/bloc/profile_bloc.dart';
import 'package:social_media/ui/profile/bloc/profile_state.dart';
import 'package:social_media/ui/splash_screen/splash_screen.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
import 'package:social_media/ui/story/bloc/story_event.dart';
import 'package:social_media/ui/story/bloc/story_state.dart';

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            HomeStateInitial(),
          )..add(HomeEventGetData()),
        ),
        BlocProvider(
          create: (context) => StoryBloc(
            StoryState(),
          )..add(StoryEventGetData()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            ProfileStateInit(),
          ),
        ),
        BlocProvider(
          create: (context) => AddPostBloc(AddPostState()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBloc(
            BottomNavigationState(value: 0),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) =>
            AppLocalizations.of(context)?.appName ?? 'Social media',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: MyTheme.themeData,
        darkTheme: MyTheme.darkThemeData,
        home: const SplashScreen(),
      ),
    );
  }
}

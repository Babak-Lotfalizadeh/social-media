import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_media/ui/home/bloc/home_bloc.dart';
import 'package:social_media/ui/home/bloc/home_state.dart';
import 'package:social_media/ui/splash_screen/splash_screen.dart';
import 'package:social_media/ui/story/bloc/story_bloc.dart';
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
          ),
        ),
        BlocProvider(
          create: (context) => StoryBloc(
            StoryState(),
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

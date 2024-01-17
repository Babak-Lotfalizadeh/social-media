import 'package:flutter/material.dart';
import 'package:social_media/core/theme/my_theme.dart';
import 'package:social_media/ui/home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appName ?? 'Social media',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.themeData,
      darkTheme: MyTheme.darkThemeData,
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media/core/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_media/ui/landing/landing_page.dart';

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
      home: const LandingPage(),
    );
  }
}

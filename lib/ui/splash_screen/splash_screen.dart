import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firebase_auth_service.dart';
import 'package:social_media/core/firebase/firestore_service.dart';
import 'package:social_media/ui/landing/landing_page.dart';
import 'package:social_media/ui/login/login_page.dart';
import 'package:social_media/ui/profile/bloc/profile_bloc.dart';
import 'package:social_media/ui/profile/bloc/profile_event.dart';
import 'package:social_media/ui/public/app_icon.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _loadInController = AnimationController(
    duration: StaticSize.animationNormal,
    vsync: this,
  );

  late final Animation<Offset> _logoOffsetAnimation = Tween<Offset>(
    begin: const Offset(-2.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _loadInController,
    curve: Curves.easeOut,
  ));

  late final Animation<Offset> _textOffsetAnimation = Tween<Offset>(
    begin: const Offset(2.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _loadInController,
    curve: Curves.easeOut,
  ));

  late final AnimationController _loadOutController = AnimationController(
    duration: StaticSize.animationNormal,
    vsync: this,
  );

  late final Animation<Offset> _containerOffsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -2.5),
  ).animate(CurvedAnimation(
    parent: _loadOutController,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    super.initState();

    Future.wait([
      _getInitialData(),
      _startAnimation(),
      Future.delayed(const Duration(seconds: 1)),
    ]).then((value) {
      _goNextPage();
    });
  }

  Future<void> _startAnimation() async {
    await _loadInController.forward().whenComplete(() {});
  }

  Future<void> _getInitialData() async {
    context.read<ProfileBloc>().add(ProfileEventGetData());
    await getIt<FireStoreService>().getInitialData();
  }

  void _goNextPage() {
    var isUserLogin = getIt<FirebaseAuthService>().isLogin();
    _loadOutController.forward().whenComplete(() {
      if(isUserLogin) {
        context.pushReplace(const LandingPage());
      } else {
        context.pushReplace(const LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      body: SlideTransition(
        position: _containerOffsetAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SafeArea(
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            SizedBox(height: StaticSize.paddingLarge),
            SlideTransition(
              position: _logoOffsetAnimation,
              child: AppIcon(
                size: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            SizedBox(
              height: StaticSize.paddingNormal,
              width: double.infinity,
            ),
            SlideTransition(
              position: _textOffsetAnimation,
              child: Text(
                strings?.appName ?? '',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

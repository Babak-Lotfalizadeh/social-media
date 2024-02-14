import 'package:flutter/material.dart';
import 'package:social_media/core/di/di_service.dart';
import 'package:social_media/core/firebase/firebase_auth_service.dart';
import 'package:social_media/ui/landing/landing_page.dart';
import 'package:social_media/ui/public/app_icon.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin() {
    getIt<FirebaseAuthService>()
        .login(email: _emailController.text, password: _passwordController.text)
        .then((result) {
      if (result) {
        context.pushReplace(const LandingPage());
      } else {
        print("can not login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              size: MediaQuery.of(context).size.width * 0.3,
            ),
            Text(
              strings?.appName ?? '',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Card(
              margin: EdgeInsets.all(StaticSize.paddingLarge),
              child: Padding(
                padding: EdgeInsets.all(StaticSize.paddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(strings?.email ?? ''),
                    TextField(
                      controller: _emailController,
                    ),
                    SizedBox(height: StaticSize.paddingLarge),
                    Text(strings?.password ?? ''),
                    TextField(
                      controller: _passwordController,
                    ),
                    SizedBox(height: StaticSize.paddingLarge),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: Theme.of(context).primaryColor,
                      onPressed: _onLogin,
                      child: Text(
                        strings?.login ?? '',
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

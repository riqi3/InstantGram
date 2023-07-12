import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/provider/auth_state_provider.dart';
import 'package:instantgram/views/login/buttons.dart';
import 'package:instantgram/views/login/constants/app_colors.dart';
import 'package:instantgram/views/login/sign_up_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            // header text
            Text(
              'Welcome to Instant-gram!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Login to your account using one of the options below',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            LoginButton(
              onTap: ref.read(authStateProvider.notifier).loginWithGithub,
              icon: FontAwesomeIcons.github,
              color: AppColors.facebookColor,
              text: 'Github',
            ),
            const SizedBox(height: 10),
            LoginButton(
              icon: FontAwesomeIcons.google,
              color: AppColors.googleColor,
              text: 'Google',
              onTap: () {
                ref.read(authStateProvider.notifier).loginWithGoogle();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            const LoginViewSignupLinks(),
          ],
        ),
      ),
    );
  }
}

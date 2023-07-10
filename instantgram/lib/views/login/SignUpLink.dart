import 'package:flutter/material.dart';
import 'package:instantgram/views/constants/strings.dart';
import 'package:instantgram/views/rich_text/base_text.dart';
import 'package:instantgram/views/rich_text/rich_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSignupLink extends StatelessWidget {
  const LoginViewSignupLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
        styleForAll: Theme.of(context).textTheme.subtitle1?.copyWith(
              height: 1.5,
            ),
        texts: [
          BaseText.plain(text: Strings.dontHaveAnAccount),
          BaseText.plain(text: Strings.signUpOn),
          BaseText.link(
              text: Strings.gitHubSignupUrl,
              onTapped: () {
                launchUrl(Uri.parse(Strings.gitHubSignupUrl));
              }),
        ]);
  }
}

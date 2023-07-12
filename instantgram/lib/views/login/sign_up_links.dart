import 'package:flutter/material.dart';
import 'package:instantgram/views/components/base_text.dart';
import 'package:instantgram/views/components/rich_text.dart';

import 'package:url_launcher/url_launcher.dart';

class LoginViewSignupLinks extends StatelessWidget {
  const LoginViewSignupLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll:
          Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5),
      texts: [
        BaseText.plain(
          text: "Don't have an acount?\n",
        ),
        BaseText.plain(
          text: "Sign up on ",
        ),
        BaseText.link(
          text: ' Github ',
          onTapped: () {
            launchUrl(
              Uri.parse(
                'https://www.github.com/signup',
              ),
            );
          },
        ),
        BaseText.plain(
          text: "or create an account on",
        ),
        BaseText.link(
          text: ' Google',
          onTapped: () {
            launchUrl(
              Uri.parse(
                'https://accounts.google.com/signup',
              ),
            );
          },
        ),
      ],
    );
  }
}

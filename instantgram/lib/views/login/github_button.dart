import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instantgram/views/constants/app_colors.dart';
import 'package:instantgram/views/constants/strings.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.github,
            color: AppColors.githubColor,
          ),
          const SizedBox(
            width: 10.0,
          ),
          const Text(
            Strings.github,
          )
        ],
      ),
    );
  }
}

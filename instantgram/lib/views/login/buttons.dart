import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instantgram/views/login/constants/app_colors.dart';

class LoginButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback? onTap;

  const LoginButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: AppColors.loginButtonColor,
          height: 44.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                color: color,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                text,
                style: const TextStyle(color: AppColors.loginButtonTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

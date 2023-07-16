import 'package:flutter/foundation.dart' show immutable;
import 'package:instantgram/views/components/PromptDialogs/dialog_model.dart';

@immutable
class LogoutPrompt extends DialogModel<bool> {
  const LogoutPrompt()
      : super(
          title: 'Logout',
          message: 'Are you sure you want to logout?',
          buttons: const {
            'Cancel': false,
            'Logout': true,
          },
        );
}

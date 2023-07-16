import 'package:flutter/material.dart';
import 'package:instantgram/views/components/PromptDialogs/dialog_model.dart';

@immutable
class DeletePrompt extends DialogModel<bool> {
  const DeletePrompt({required String toBeDeletedPostTitle})
      : super(
          title: 'Delete post \'$toBeDeletedPostTitle\'?',
          message: 'Are you sure to delete \'$toBeDeletedPostTitle\'?',
          buttons: const {
            'Cancel': false,
            'Delete': true,
          },
        );
}

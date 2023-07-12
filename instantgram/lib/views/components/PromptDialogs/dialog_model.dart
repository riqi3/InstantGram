import 'package:flutter/material.dart';

@immutable
class DialogModel<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;

  const DialogModel({
    required this.title,
    required this.message,
    required this.buttons,
  });
}

extension Present<T> on DialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: buttons.entries.map(
            (entry) {
              return TextButton(
                child: Text(
                  entry.key,
                ),
                onPressed: () {
                  Navigator.of(context).pop(
                    entry.value,
                  );
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
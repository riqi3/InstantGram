import 'dart:collection' show MapView;

import 'package:flutter/foundation.dart' show immutable;
import 'package:instantgram/state/constants/user_name_field.firebase.dart';
import 'package:instantgram/state/post/typedefs/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
          },
        );
}

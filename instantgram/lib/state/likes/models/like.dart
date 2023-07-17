import 'dart:collection' show MapView;

import 'package:flutter/cupertino.dart';

import '../../constants/user_name_field.firebase.dart';
import '../../post/typedefs/post_id.dart';
import '../../post/typedefs/user_id.dart';

@immutable
class Like extends MapView<String, String> {
  Like({
    required PostId postId,
    required UserId likedBy,
    required DateTime date,
  }) : super(
          {
            FirebaseFieldName.postId: postId,
            FirebaseFieldName.userId: likedBy,
            FirebaseFieldName.date: date.toIso8601String(),
          },
        );
}

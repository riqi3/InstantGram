import 'package:flutter/foundation.dart' show immutable;

import '../../post/typedefs/post_id.dart';
import '../../post/typedefs/user_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;
  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}

import 'package:flutter/foundation.dart' show immutable;
import 'package:instantgram/state/posts/typedefs/posts_id.dart';
import 'package:instantgram/state/posts/typedefs/user_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;
  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}

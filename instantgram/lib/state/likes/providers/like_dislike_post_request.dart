import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instantgram/state/constants/collection_firebase.dart';
import 'package:instantgram/state/constants/user_name_field.firebase.dart';
import 'package:instantgram/state/likes/models/like.dart';
import 'package:instantgram/state/likes/models/like_dislike_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_dislike_post_request.g.dart';

@riverpod
Future<bool> likeDislikePost(
  LikeDislikePostRef ref, {
  required LikeDislikeRequest request,
}) async {
  final query = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.likes)
      .where(
        FirebaseFieldName.postId,
        isEqualTo: request.postId,
      )
      .where(
        FirebaseFieldName.userId,
        isEqualTo: request.likedBy,
      )
      .get();

  final hasLiked = await query.then(
    (snapshot) => snapshot.docs.isNotEmpty,
  );

  if (hasLiked) {
    try {
      await query.then((snapshot) async {
        for (final doc in snapshot.docs) {
          await doc.reference.delete();
        }
      });
      return true;
    } catch (_) {
      return false;
    }
  } else {
    final like = Like(
      postId: request.postId,
      likedBy: request.likedBy,
      date: DateTime.now(),
    );

    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.likes)
          .add(like);
      return true;
    } catch (_) {
      return false;
    }
  }
}

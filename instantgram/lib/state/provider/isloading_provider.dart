import 'package:instantgram/state/auth/provider/auth_state_provider.dart';
import 'package:instantgram/state/comments/providers/delete_comment_provider.dart';
import 'package:instantgram/state/comments/providers/send_comments_provider.dart';
import 'package:instantgram/state/img_upload/provider/uploader.dart';
import 'package:instantgram/state/post/provider/delete_post_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isloading_provider.g.dart';

@riverpod
bool isLoading(IsLoadingRef ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(uploaderProvider);
  final isSendingComment = ref.watch(sendCommentProvider);
  final isDeletingComment = ref.watch(deleteCommentProvider);
  final isDeletingPost = ref.watch(deletePostProvider);

  return authState.isLoading ||
      isUploadingImage ||
      isSendingComment ||
      isDeletingComment ||
      isDeletingPost;
}

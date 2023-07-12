import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/views/components/PromptDialogs/delete_prompt.dart';
import 'package:instantgram/views/components/PromptDialogs/dialog_model.dart';
import 'package:instantgram/views/components/lotties/error_lottie_view.dart';
import '../../state/auth/provider/user_id_provider.dart';
import '../../state/comments/models/comment.dart';
import '../../state/comments/providers/delete_comment_provider.dart';
import '../../state/user_details/models/provider/user_model_provider.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(
      userInfoModelProvider(
        comment.fromUserId,
      ),
    );
    return userInfo.when(
      data: (userInfo) {
        final currentUserId = ref.read(userIdProvider);
        return ListTile(
          trailing: currentUserId == comment.fromUserId
              ? IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final shouldDeleteComment =
                        await displayDeleteDialog(context);
                    if (shouldDeleteComment) {
                      await ref
                          .read(
                            deleteCommentProvider.notifier,
                          )
                          .deleteComment(
                            commentId: comment.id,
                          );
                    }
                  },
                )
              : null,
          title: Text(
            userInfo.displayName,
          ),
          subtitle: Text(
            comment.comment,
          ),
        );
      },
      error: (error, stackTrace) {
        return const ErrorLottieView();
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeletePrompt(toBeDeletedPostTitle: "Comment").present(context).then(
            (value) => value ?? false,
          );
}

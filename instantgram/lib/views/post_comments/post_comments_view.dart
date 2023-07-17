import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/views/extensions/dissmiss_keyboard.dart';

import '../../state/auth/provider/user_id_provider.dart';
import '../../state/comments/models/request_post_comments.dart';
import '../../state/comments/providers/post_comments_provider.dart';
import '../../state/comments/providers/send_comments_provider.dart';
import '../../state/post/models/post.dart';
import '../comments/comment_tile.dart';
import '../components/lotties/empty_contents_with_text_lottie_view.dart';
import '../components/lotties/error_lottie_view.dart';
import '../components/lotties/loading_lottie.dart';

class PostCommentsView extends HookConsumerWidget {
  // final PostId postId;
  final RequestForPostAndComments req;
  final Post post;
  const PostCommentsView({Key? key, required this.post, required this.req})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final hasText = useState(false);
    final request = useState(
      RequestForPostAndComments(
        postId: post.postId,
      ),
    );
    final comments = ref.watch(
      postCommentsProvider(
        request.value,
      ),
    );

    useEffect(
      () {
        commentController.addListener(() {
          hasText.value = commentController.text.isNotEmpty;
        });
        return () {};
      },
      [commentController],
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Comments",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: hasText.value
                ? () {
                    _submitCommentWithController(
                      commentController,
                      ref,
                    );
                  }
                : null,
          ),
        ],
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: comments.when(
                data: (comments) {
                  if (comments.isEmpty) {
                    return const SingleChildScrollView(
                      child: EmptyContentsWithTextLottieView(
                        text: "No Comments Yet",
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(
                        postCommentsProvider(
                          request.value,
                        ),
                      );
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments.elementAt(index);
                        return CommentTile(
                          comment: comment,
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const ErrorLottieView();
                },
                loading: () {
                  return const Center(child: LoadingLottieView());
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    controller: commentController,
                    onSubmitted: (comment) {
                      if (comment.isNotEmpty) {
                        _submitCommentWithController(
                          commentController,
                          ref,
                        );
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Write your comment here...',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitCommentWithController(
    TextEditingController controller,
    WidgetRef ref,
  ) async {
    final userId = ref.read(userIdProvider);
    if (userId == null) {
      return;
    }
    final isSent = await ref
        .read(
          sendCommentProvider.notifier,
        )
        .sendComment(
          fromUserId: userId,
          onPostId: post.postId,
          comment: controller.text,
        );
    if (isSent) {
      controller.clear();
      dismissKeyboard();
    }
  }
}

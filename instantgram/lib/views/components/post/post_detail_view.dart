// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:instantgram/views/components/like_button.dart';
import 'package:instantgram/views/components/likes_count_view.dart';
import 'package:instantgram/views/components/post/post_date_view.dart';
import 'package:instantgram/views/components/post/post_display_name_and_message_view.dart';
import 'package:instantgram/views/components/post/post_image_or_video_view.dart';

import '../../../enums/date_sorting.dart';
import '../../../state/comments/models/post_comments_request.dart';
import '../../../state/posts/models/post.dart';
import '../../../state/providers/allow_user_delete_post_provider.dart';
import '../../../state/providers/specific_post_with_comments_provider.dart';
import '../../post_components/post_comments_view.dart';
import '../animations/error_animation_view.dart';
import '../animations/loading_animation_view.dart';
import '../comment/compact_comments_column.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;
  const PostDetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComments(
      postId: widget.post.postId,
      limit: 3,
      sortByCreatedAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );

    final postWithComments = ref.watch(
      specificPostWithCommentsProvider(
        request,
      ),
    );

    final canDeletePost = ref.watch(
      canCurrentUserDeletePostProvider(
        widget.post,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post Details",
        ),
        actions: [
          postWithComments.when(
            data: (postWithComments) {
              return IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  print('share');
                  // final url = postWithComments.post.fileUrl;
                  // Share.share(
                  //   url,
                  //   subject: "Check out this post!",
                  // );
                },
              );
            },
            error: (error, stackTrace) {
              return const Center(child: ErrorAnimationView());
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                print('delete');
                // final shouldDeletePost =
                //     await const DeletePrompt(toBeDeletedPostTitle: "Post")
                //         .present(context)
                //         .then((shouldDelete) => shouldDelete ?? false);
                // if (shouldDeletePost) {
                //   await ref
                //       .read(deletePostProvider.notifier)
                //       .deletePost(post: widget.post);

                //   if (mounted) {
                //     Navigator.of(context).pop();
                //   }
                // }
              },
            )
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(
                  post: postWithComments.post,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (postWithComments.post.allowsLikes)
                      LikeButton(
                        postId: postId,
                      ),
                    if (postWithComments.post.allowsComments)
                      IconButton(
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCommentsView(
                                postId: '1',
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                PostDisplayNameAndMessageView(
                  post: postWithComments.post,
                ),
                PostDateView(
                  dateTime: postWithComments.post.createdAt,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
                CompactCommentsColumn(
                  comments: postWithComments.comments.toSet(),
                ),
                if (postWithComments.post.allowsLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikesCountView(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const Center(child: LoadingAnimationView());
        },
      ),
    );
  }
}

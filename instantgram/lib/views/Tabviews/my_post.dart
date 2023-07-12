// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/post/provider/user_post_provider.dart';
import 'package:instantgram/views/components/lotties/empty_lottie_view.dart';
import 'package:instantgram/views/components/lotties/loading_lottie.dart';
import 'package:instantgram/views/components/post/posts_layouts.dart';

import '../components/lotties/error_lottie_view.dart';

class MyPostsView extends ConsumerWidget {
  const MyPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(userPostsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(userPostsProvider);
      },
      child: postsAsyncValue.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyLottieView();
          } else {
            return PostsLayout(posts: posts);
          }
        },
        loading: () {
          return const Center(child: LoadingLottieView());
        },
        error: (error, stackTrace) {
          return const Center(child: ErrorLottieView());
        },
      ),
    );
  }
}

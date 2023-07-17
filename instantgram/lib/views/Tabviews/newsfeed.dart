// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
 

import '../../state/post/provider/all_post_provider.dart';
import '../components/lotties/empty_lottie_view.dart';
import '../components/lotties/error_lottie_view.dart';
import '../components/post/posts_layouts.dart';

class Newsfeed extends ConsumerWidget {
  const Newsfeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allposts = ref.watch(allPostsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(allPostsProvider);
      },
      child: allposts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyLottieView();
          } else {
            return PostsLayout(posts: posts);
          }
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return const Center(child: ErrorLottieView());
        },
      ),
    );
  }
}

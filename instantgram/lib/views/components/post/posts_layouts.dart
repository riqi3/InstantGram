import 'package:flutter/material.dart';
<<<<<<< HEAD:instantgram/lib/views/components/post/posts_layouts.dart
import 'package:instantgram/state/post/models/post.dart';
import 'package:instantgram/views/components/post/post_thumbnail.dart';
=======
import 'package:instantgram/state/posts/models/post.dart';
import 'package:instantgram/views/components/post/post_detail_view.dart';
import 'package:instantgram/views/components/post/post_thumbnail_view.dart';
>>>>>>> talandron-additions-1:instantgram/lib/views/components/post/post_grid_view.dart

import '../../post_details/post_detail_view.dart';

class PostsLayout extends StatelessWidget {
  final Iterable<Post> posts;

  const PostsLayout({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailsView(
                  post: post,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

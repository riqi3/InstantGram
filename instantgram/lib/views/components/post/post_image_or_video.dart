import 'package:flutter/material.dart';
import 'package:instantgram/views/components/post/post_image.dart';
import 'package:instantgram/views/components/post/post_video.dart';
import '../../../state/img_upload/model/ftype.dart';
import '../../../state/post/models/post.dart';

class PostImageOrVideoView extends StatelessWidget {
  final Post post;
  const PostImageOrVideoView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    switch (post.fileType) {
      case FType.image:
        return PostImageView(
          post: post,
        );
      case FType.video:
        return PostVideoView(
          post: post,
        );
      default:
        return const SizedBox();
    }
  }
}

class FileType {}

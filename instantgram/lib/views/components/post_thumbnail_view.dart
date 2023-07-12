import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/img_upload/model/thumbnail_req.dart';
import 'package:instantgram/state/img_upload/provider/thumbnail_provider.dart';

import 'lotties/loading_lottie.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;

  const FileThumbnailView({
    Key? key,
    required this.thumbnailRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(
        thumbnailRequest,
      ),
    );

    return thumbnail.when(
      data: (imageMod) {
        return AspectRatio(
          aspectRatio: imageMod.ratio,
          child: imageMod.image,
        );
      },
      loading: () {
        return const Center(child: LoadingLottieView());
      },
      error: (error, stackTrace) {
        return Container();
      },
    );
  }
}

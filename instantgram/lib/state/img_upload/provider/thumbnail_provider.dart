import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/img_upload/extenssion/get_aspect_ratio.dart';

import 'package:video_thumbnail/video_thumbnail.dart';

import '../exceptions/thumbnail_exceptions.dart';
import '../model/ftype.dart';
import '../model/image_adjust_mod.dart';
import '../model/thumbnail_req.dart';

final thumbnailProvider =
    FutureProvider.family.autoDispose<ImageMod, ThumbnailRequest>((
  ref,
  ThumbnailRequest request,
) async {
  final Image image;

  switch (request.fileType) {
    case FType.image:
      image = Image.file(
        request.file,
        fit: BoxFit.fitHeight,
      );
      break;
    case FType.video:
      final thumb = await VideoThumbnail.thumbnailData(
        video: request.file.path,
        imageFormat: ImageFormat.JPEG,
        quality: 75,
      );
      if (thumb == null) {
        throw const CouldNotBuildThumbnailException();
      }
      image = Image.memory(
        thumb,
        fit: BoxFit.fitHeight,
      );
  }

  final aspectRatio = await image.getAspectRatio();
  return ImageMod(
    image: image,
    ratio: aspectRatio,
  );
});

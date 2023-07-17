import 'dart:io' show File;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;

import 'package:instantgram/state/img_upload/constants/constants.dart';

import 'package:instantgram/state/img_upload/extenssion/get_collection_name.dart';
import 'package:instantgram/state/img_upload/extenssion/get_image_data.dart';

import '../../constants/collection_firebase.dart';
import '../../post/models/post_payload.dart';
import '../../post_prefference/models/post_prefference.dart';
import '../exceptions/thumbnail_exceptions.dart';
import '../model/ftype.dart';

import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ImageUploadNotifier extends StateNotifier<bool> {
  ImageUploadNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> upload({
    required File file,
    required FType fileType,
    required String message,
    required Map<PostPref, bool> postSettings,
    required String userId,
  }) async {
    isLoading = true;

    late Uint8List thumbnailUint8List;

    switch (fileType) {
      case FType.image:
        final fileAsImage = img.decodeImage(file.readAsBytesSync());
        if (fileAsImage == null) {
          isLoading = false;
          return false;
        }
        final thumbnail = img.copyResize(
          fileAsImage,
          width: Constants.imageThumbnailWidth,
        );
        final thumbnailData = img.encodeJpg(thumbnail);
        thumbnailUint8List = Uint8List.fromList(thumbnailData);
        break;
      case FType.video:
        final thumb = await VideoThumbnail.thumbnailData(
          video: file.path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: Constants.videoThumbnailMaxHeight,
          quality: Constants.videoThumbnailQuality,
        );
        if (thumb == null) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        } else {
          thumbnailUint8List = thumb;
        }
        break;
    }

    final thumbnailAspectRatio = await thumbnailUint8List.getAspectRatio();

    final fileName = const Uuid().v4();

    final thumbnailRef = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child(FirebaseCollectionName.thumbnails)
        .child(fileName);

    final originalFileRef = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child(fileType.collectionName)
        .child(fileName);

    try {
      final thumbnailUploadTask =
          await thumbnailRef.putData(thumbnailUint8List);
      final thumbnailStorageId = thumbnailUploadTask.ref.name;

      final originalFileUploadTask = await originalFileRef.putFile(file);
      final originalFileStorageId = originalFileUploadTask.ref.name;

      final postPayload = PostPayload(
        userId: userId,
        message: message,
        thumbnailUrl: await thumbnailRef.getDownloadURL(),
        fileUrl: await originalFileRef.getDownloadURL(),
        fileType: fileType,
        fileName: fileName,
        aspectRatio: thumbnailAspectRatio,
        postSettings: postSettings,
        thumbnailStorageId: thumbnailStorageId,
        originalFileStorageId: originalFileStorageId,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.posts)
          .add(postPayload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}

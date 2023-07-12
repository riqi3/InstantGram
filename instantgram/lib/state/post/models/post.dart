import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instantgram/state/img_upload/model/ftype.dart';
import 'package:instantgram/state/post/models/post_keys.dart';
import 'package:instantgram/state/post_prefference/models/post_prefference.dart';

@immutable
class Post {
  final String postId;
  final String userId;
  final String message;
  final DateTime createdAt;
  final String thumbnailUrl;
  final String fileUrl;
  final FType fileType;
  final String fileName;
  final double aspectRatio;
  final String thumbnailStorageId;
  final String originalFileStorageId;
  final Map<PostPref, bool> postSettings;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        message = json[PostKey.message],
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate(),
        thumbnailUrl = json[PostKey.thumbnailUrl],
        fileUrl = json[PostKey.fileUrl],
        fileType = FType.values.firstWhere(
          (fileType) => fileType.name == json[PostKey.fileType],
          orElse: () => FType.image,
        ),
        fileName = json[PostKey.fileName],
        aspectRatio = json[PostKey.aspectRatio],
        thumbnailStorageId = json[PostKey.thumbnailStorageId],
        originalFileStorageId = json[PostKey.originalFileStorageId],
        postSettings = {
          for (final entry in json[PostKey.postSettings].entries)
            PostPref.values.firstWhere(
              (element) => element.storageK == entry.key,
            ): entry.value,
        };

  bool get allowsLikes => postSettings[PostPref.enableLikes] ?? false;
  bool get allowsComments => postSettings[PostPref.enableComments] ?? false;
}

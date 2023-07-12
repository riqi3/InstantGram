import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/img_upload/notifier/image_upload_notifier.dart';

final uploaderProvider = StateNotifierProvider<ImageUploadNotifier, bool>(
  (ref) => ImageUploadNotifier(),
);

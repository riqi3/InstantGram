import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifier/image_upload_notifier.dart';

final uploaderProvider = StateNotifierProvider<ImageUploadNotifier, bool>(
  (ref) => ImageUploadNotifier(),
);

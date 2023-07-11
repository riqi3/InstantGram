import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/comments/notifiers/send_comment_notifier.dart';
import 'package:instantgram/state/image_upload/typedefs/is_loading.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>(
  (ref) => SendCommentNotifier(),
);

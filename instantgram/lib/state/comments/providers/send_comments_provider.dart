import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../img_upload/typedefs/is_loading.dart';
import '../notifiers/send_comment_notifier.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>(
  (ref) => SendCommentNotifier(),
);
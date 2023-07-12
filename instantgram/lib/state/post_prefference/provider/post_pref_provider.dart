import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/post_prefference/models/post_prefference.dart';
import 'package:instantgram/state/post_prefference/notifiers/post_pref_notifier.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingNotifier, Map<PostPref, bool>>(
  (ref) => PostSettingNotifier(),
);

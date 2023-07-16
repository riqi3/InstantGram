import 'dart:collection' show UnmodifiableMapView;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/post_prefference/models/post_prefference.dart';

class PostSettingNotifier extends StateNotifier<Map<PostPref, bool>> {
  PostSettingNotifier()
      : super(
          UnmodifiableMapView(
            {
              for (final setting in PostPref.values) setting: true,
            },
          ),
        );
  void setSetting(
    PostPref setting,
    bool value,
  ) {
    final existingValue = state[setting];
    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}

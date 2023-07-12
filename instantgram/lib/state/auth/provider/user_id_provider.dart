import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/provider/auth_state_provider.dart';
import 'package:instantgram/state/post/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);

import 'package:hooks_riverpod/hooks_riverpod.dart' show StateNotifierProvider;
import 'package:instantgram/state/auth/modelEnums/authentication_state.dart';
import 'package:instantgram/state/auth/notifier/auth_state_notif.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

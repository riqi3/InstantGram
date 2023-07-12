import 'package:instantgram/state/auth/modelEnums/authentication_results.dart';
import 'package:instantgram/state/auth/provider/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});

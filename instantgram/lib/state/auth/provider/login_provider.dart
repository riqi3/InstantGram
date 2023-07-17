 
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../modelEnums/authentication_results.dart';
import 'auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});

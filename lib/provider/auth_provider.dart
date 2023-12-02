import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth/core/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_provider.g.dart';

// ジェネレーターを使わない場合
// final authStateProvider = StreamProvider((ref){
//   return supabaseClient.auth.onAuthStateChange;
// });

@riverpod
Stream<AuthState> authState(AuthStateRef ref) {
  return supabaseClient.auth.onAuthStateChange;
}

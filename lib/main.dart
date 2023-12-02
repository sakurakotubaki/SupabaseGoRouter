import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth/apikey.dart';
import 'package:supabase_auth/myapp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // URLとanon keyの設定をする
  await Supabase.initialize(
    url: URL,
    anonKey: ANON_KEY,

  );

  runApp(const ProviderScope(child: MyApp()));
}

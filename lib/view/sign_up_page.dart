import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_auth/core/supabase_client.dart';
import 'package:supabase_auth/view/input_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputForm(
              width: 300,
              height: 50,
              labelText: 'メールアドレスを入力',
              controller: email,
              formColor: Colors.grey[200]!,
              contentPadding: 10,
              obscureText: false,
            ),
            const SizedBox(height: 10),
            InputForm(
              width: 300,
              height: 50,
              labelText: 'パスワードを入力',
              controller: password,
              formColor: Colors.grey[200]!,
              contentPadding: 10,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                signUpUser(email.text, password.text);
              },
              child: const Text('新規登録'),
            ),
          ],
        ),
      ),
    );
  }

  //ユーザーの新規登録をするメソッド.
  Future<void> signUpUser(String email, String password) async {
    try {
      if (email.isEmpty) {
        throw ('メールアドレスが入力されていません!');
      }

      if (password.isEmpty) {
        throw ('パスワードが入力されていません!');
      }

      final AuthResponse res =
          await supabaseClient.auth.signUp(email: email, password: password);
      log(res.toString());
    } catch (e) {
      if (context.mounted) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // throwのエラーメッセージがダイアログで表示される.
              title: Text(e.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}

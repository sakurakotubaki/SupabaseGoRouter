import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth/core/router_path.dart';
import 'package:supabase_auth/provider/auth_provider.dart';
import 'package:supabase_auth/view/document_page.dart';
import 'package:supabase_auth/view/home_page.dart';
import 'package:supabase_auth/view/sign_in_page.dart';
import 'package:supabase_auth/view/sign_up_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
      initialLocation: RouterPath.SIGNIN,
      redirect: (context, state) async {
        // ログインしているかどうかを確認するプロパティ
        final loggedIn = authState.value?.session?.user != null;

        // final loggingIn = state.matchedLocation == RouterPath.SIGNIN;

        // // ログインしている場合はホームページにリダイレクトする
        // if(loggedIn) {
        //   return RouterPath.HOME;
        // // ログインしていない場合はログインページにリダイレクトする
        // } else if(!loggedIn || loggingIn) {
        //   return RouterPath.SIGNIN;
        // // ログインしていなくて、アカウントがなければ新規登録ページにリダイレクトする
        // } else if(!loggedIn && !loggingIn) {
        //   return RouterPath.SIGNUP;
        // }

        switch (state.matchedLocation) {
          case RouterPath.SIGNIN:
            if (loggedIn) {
              return RouterPath.HOME;
            } else {
              return RouterPath.SIGNIN;
            }
          case RouterPath.SIGNUP:
            if (loggedIn) {
              return RouterPath.HOME;
            } else {
              return RouterPath.SIGNUP;
            }
          case RouterPath.HOME:
            if (loggedIn) {
              return RouterPath.HOME;
            } else {
              return RouterPath.SIGNIN;
            }
          default:
            return null;
        }
      },
      routes: [
        GoRoute(
          path: RouterPath.SIGNIN,
          name: RouterPath.SIGNIN,
          builder: (context, state) => const SignInPage(),
          routes: [
            // 詳細ページへのルーティング
            GoRoute(
              path: RouterPath.SIGNUP,
              name: RouterPath.SIGNUP,
              builder: (context, state) {
                return const SignUpPage();
              },
            ),
            // ドキュメントページへのルーティング
            GoRoute(
              path: RouterPath.DOCUMENT,
              name: RouterPath.DOCUMENT,
              builder: (context, state) {
                return const DocumentPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: RouterPath.HOME,
          name: RouterPath.HOME,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ],
      // 404ページを指定
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ));
      });
}

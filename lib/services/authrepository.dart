import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus { unkown, authenticated, unauthenticated }

class AuthRepository implements Exception {
  final _controller = StreamController<AuthStatus>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//Registration for User
  Future<void> signUp({required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account is already in use with that email');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /* Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  } */

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential currentuser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return currentuser.user;
    } catch (e) {
      return null;
    }
  }

  void logout() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

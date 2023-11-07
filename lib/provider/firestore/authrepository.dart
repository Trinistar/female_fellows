import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { unkown, authenticated, unauthenticated }

class AuthRepository implements Exception {
  AuthRepository({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final _controller = StreamController<AuthStatus>();

//Registration for User
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential currentuser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return currentuser.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account is already in use with that email');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
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
      final UserCredential currentuser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return currentuser.user;
    } catch (e) {
      return null;
    }
  }

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User?> get user {
    //return _firebaseAuth.authStateChanges().listen((event) { });
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      currentUser = firebaseUser;
      if (firebaseUser != null) {
        return firebaseUser;
      } else {
        return null;
      }
    });
  }

  User? get currentUser {
    return null;
  }

  set currentUser(user) {}

  Future<List<void>> logOut() async {
    return Future.wait(<Future<void>>[
      _firebaseAuth.signOut(),
    ]);
  }

  void dispose() => _controller.close();
}

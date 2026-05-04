import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  User? _user;
  bool _initialized = false;
  late final StreamSubscription<User?> _subscription;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isEmailVerified => _user?.emailVerified ?? false;
  bool get isInitialized => _initialized;

  AuthViewModel() {
    // userChanges() emits on sign-in, sign-out AND profile updates (displayName, etc.)
    _subscription = FirebaseAuth.instance.userChanges().listen((user) {
      _user = user;
      _initialized = true;
      notifyListeners();
    });
  }

  Future<void> reloadUser() async {
    await FirebaseAuth.instance.currentUser?.reload();
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> sendVerificationEmail() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

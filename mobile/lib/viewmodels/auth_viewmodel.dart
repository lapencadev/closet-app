import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  User? _user;
  bool _initialized = false;
  late final StreamSubscription<User?> _subscription;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isInitialized => _initialized;

  AuthViewModel() {
    // userChanges() emits on sign-in, sign-out AND profile updates (displayName, etc.)
    _subscription = FirebaseAuth.instance.userChanges().listen((user) {
      _user = user;
      _initialized = true;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/viewmodels/auth_viewmodel.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthViewModel? _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newViewModel = context.read<AuthViewModel>();
    if (_viewModel != newViewModel) {
      _viewModel?.removeListener(_onAuthChanged);
      _viewModel = newViewModel;
      _viewModel!.addListener(_onAuthChanged);
    }
  }

  void _onAuthChanged() {
    if (!mounted) return;
    final auth = context.read<AuthViewModel>();
    if (!auth.isInitialized) return;
    // Pop RegisterScreen / LoginScreen off the stack so build() renders correctly
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _viewModel?.removeListener(_onAuthChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    if (!auth.isInitialized) {
      return PlatformScaffold(
        body: const Center(child: PlatformCircularProgressIndicator()),
      );
    }

    return auth.isLoggedIn
        ? const MyHomePage(title: 'My Closet')
        : const LoginScreen();
  }
}

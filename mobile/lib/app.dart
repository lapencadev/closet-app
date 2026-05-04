import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobile/screens/auth_wrapper.dart';
import 'package:mobile/utils/app_colors.dart';
import 'package:mobile/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformApp(
        debugShowCheckedModeBanner: false,
        title: 'My Closet',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        material: (_, __) => MaterialAppData(theme: AppTheme.lightTheme),
        cupertino: (_, __) => CupertinoAppData(
          theme: const CupertinoThemeData(
            primaryColor: AppColors.primary,
            barBackgroundColor: AppColors.surface,
            scaffoldBackgroundColor: AppColors.background,
          ),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

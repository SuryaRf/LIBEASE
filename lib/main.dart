import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libease_app/core/theme/app_theme.dart';
import 'package:libease_app/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: LibEaseApp(),
    ),
  );
}

class LibEaseApp extends StatelessWidget {
  const LibEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LibEase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}

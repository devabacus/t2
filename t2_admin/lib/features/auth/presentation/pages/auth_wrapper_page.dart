// lib/features/auth/presentation/pages/auth_wrapper_page.dart
import 'package:flutter/material.dart';

class AuthWrapperPage extends StatelessWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    // GoRouter сам обработает редирект, нам нужен только экран загрузки
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
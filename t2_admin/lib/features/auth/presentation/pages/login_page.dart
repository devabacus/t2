// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import '../../../../core/providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Dialog(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            child: SignInWithEmailButton(
              caller: ref.read(serverpodClientProvider).modules.auth,
            ),
          ),
        ),
      ),
    );
  }
}
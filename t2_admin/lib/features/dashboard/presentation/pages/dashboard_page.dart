// lib/features/dashboard/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель управления'),
      ),
      body: const Center(
        child: Text('Здесь будет статистика'),
      ),
    );
  }
}
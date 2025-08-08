// lib/features/customers/presentation/pages/customer_list_page.dart
import 'package:flutter/material.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Клиенты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement create customer dialog
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Здесь будет список клиентов'),
      ),
    );
  }
}
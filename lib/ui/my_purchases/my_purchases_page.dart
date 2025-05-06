import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPurchasesPage extends StatelessWidget {
  const MyPurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> compras = [
      {
        'evento': 'Concierto de Rock',
        'fecha': '10/05/2025',
        'codigo': 'TCK12345',
      },
      {'evento': 'Obra de Teatro', 'fecha': '20/06/2025', 'codigo': 'TCK67890'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('My Purchases'),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: compras.length,
        itemBuilder: (context, index) {
          final compra = compras[index];
          return Card(
            child: ListTile(
              onTap: () {
                context.push('/ticket/1');
              },
              title: Text(compra['evento']!),
              subtitle: Text(
                'Fecha: ${compra['fecha']!}\nCódigo: ${compra['codigo']!}',
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
      appBar: AppBar(backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: compras.length,
        itemBuilder: (context, index) {
          final compra = compras[index];
          return Card(
            child: ListTile(
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

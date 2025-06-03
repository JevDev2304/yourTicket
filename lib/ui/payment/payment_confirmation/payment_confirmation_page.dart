import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final EventDetailed event;
  const PaymentConfirmationPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        '${event.date.month}/${event.date.day}/${event.date.year}';

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      // appBar: AppBar(
      //   title: const Text('Confirmación'),
      //   backgroundColor: Theme.of(context).primaryColor,
      //   foregroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment successful!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We have sent to your email your ticket.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 30),

            // Evento de ejemplo
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.event, color: Colors.deepPurple),
                title: Text(event.name),
                subtitle: Text('$formattedDate - ${event.address}'),
              ),
            ),

            const SizedBox(height: 30),

            // Botones de navegación
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.home_outlined),
                  onPressed: () {
                    context.go('/home');
                  },
                  label: const Text('Home page'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.receipt_long_outlined),
                  onPressed: () {
                    context.go('/my_purchases');
                  },
                  label: const Text('My purchases'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {
                    context.go('/profile');
                  },
                  label: const Text('My profile'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/my_purchases/widgets/ticket_item.dart';

class MyPurchasesPage extends StatelessWidget {
  const MyPurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Event> purchases = [
      Event(
        id: 1,
        name: 'Rock Concert',
        category: 'Concert',
        date: DateTime(2025, 5, 10),
        imageUrl:
            'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2?fit=crop&w=800&q=80',
      ),
      Event(
        id: 2,
        name: 'Theater Play',
        category: 'Theater',
        date: DateTime(2025, 6, 20),
        imageUrl:
            'https://images.unsplash.com/photo-1533236897111-3e94666b2edf?fit=crop&w=800&q=80',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          'My Purchases',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          final event = purchases[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TicketItem(event: event),
          );
        },
      ),
    );
  }
}

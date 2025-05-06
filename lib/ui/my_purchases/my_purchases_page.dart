import 'package:flutter/material.dart';
import 'package:tickets_app/domain/model/ticket.dart';

class MyPurchasesPage extends StatelessWidget {
  const MyPurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TicketDetailed> purchases = [
      TicketDetailed(
        id: 1,
        name: 'Rock Concert',
        type: 'VIP',
        ticketHolderName: 'Laura García',
        date: DateTime(2025, 5, 10),
        imageUrl: 'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2?fit=crop&w=800&q=80',
      ),
      TicketDetailed(
        id: 2,
        name: 'Theater Play',
        type: 'General',
        ticketHolderName: 'Laura García',
        date: DateTime(2025, 6, 20),
        imageUrl: 'https://images.unsplash.com/photo-1533236897111-3e94666b2edf?fit=crop&w=800&q=80',
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
          final ticket = purchases[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    ticket.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(ticket.ticketHolderName),
                      const SizedBox(height: 4),
                      Text(ticket.type),
                      const SizedBox(height: 4),
                      Text('${ticket.date.toLocal().toString().split(' ')[0]}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

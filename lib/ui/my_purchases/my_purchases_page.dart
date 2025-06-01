import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/ui/my_purchases/providers/controller_ticket_provider.dart';
import 'package:tickets_app/ui/my_purchases/widgets/ticket_item.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class MyPurchasesPage extends ConsumerWidget {
  const MyPurchasesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final List<Ticket> purchases = [
    //   Ticket(
    //     id: 1,
    //     name: 'Rock Concert',
    //     type: 'VIP',
    //     ticketHolderName: 'Laura García',
    //     date: DateTime(2025, 5, 10),
    //     imageUrl:
    //         'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2?fit=crop&w=800&q=80',
    //   ),
    //   Ticket(
    //     id: 2,
    //     name: 'Theater Play',
    //     type: 'General',
    //     ticketHolderName: 'Laura García',
    //     date: DateTime(2025, 6, 20),
    //     imageUrl:
    //         'https://images.unsplash.com/photo-1533236897111-3e94666b2edf?fit=crop&w=800&q=80',
    //   ),
    // ];

    User user = FirebaseAuth.instance.currentUser!;
    final ticketListState = ref.watch(ticketControllerProvider(user.email!));

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
      body:
          ticketListState.isLoading
              ? Loading()
              : ticketListState.errorMessage != null
              ? ErrorState(ticketListState.errorMessage!)
              : ticketListState.listOfTickets.isEmpty
              ? EmptyState()
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: ticketListState.listOfTickets.length,
                itemBuilder: (context, index) {
                  final ticket = ticketListState.listOfTickets[index];
                  return TicketItem(ticket: ticket);
                },
              ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_state_controller.dart';
import 'package:tickets_app/ui/my_purchases/providers/controller_ticket_provider.dart';
import 'package:tickets_app/ui/my_purchases/widgets/ticket_item.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class MyPurchasesPage extends ConsumerWidget {
  const MyPurchasesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = FirebaseAuth.instance.currentUser!;
    final ticketListState = ref.watch(ticketControllerProvider(user.email!));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(ticketControllerProvider(user.email!).notifier)
              .reset(user.email!);
        },
        child: const Icon(Icons.refresh),
        tooltip: 'Reset',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

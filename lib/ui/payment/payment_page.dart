import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_state_controller.dart';
import 'package:tickets_app/ui/my_purchases/providers/controller_ticket_provider.dart';

class PaymentPage extends ConsumerStatefulWidget {
  final EventDetailed event;

  const PaymentPage(this.event, {super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  String? _ticketType;

  void _pay(User user, EventDetailed event) {
    if (_formKey.currentState!.validate()) {
      if (_ticketType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a ticket type')),
        );
        return;
      }

      // Simulate payment or pass _ticketType to your backend
      // print('Selected ticket type: $_ticketType');

      ref
          .read(paymentControllerProvider.notifier)
          .payment(user.email!, event.id.toString(), _ticketType!);
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;

    final EventDetailed event = widget.event;

    ref.listen<TicketState>(paymentControllerProvider, (previous, next) {
      if (!next.isLoading) {
        if (next.errorMessage != null) {
          context.go('/confirmation');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${next.errorMessage}')),
          );
        }
      }
    });

    String formattedDate =
        '${event.date.month}/${event.date.day}/${event.date.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    event.imageUrl,
                    // 'https://images.squarespace-cdn.com/content/v1/62502cbe020d59057d88d958/080907e5-94d6-491d-9c60-3d8099731559/patterns-by-angry-jalebi-62.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 180,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '$formattedDate • ${event.address}',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Ticket Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Ticket Type'),
                    items: const [
                      DropdownMenuItem(
                        value: 'general',
                        child: Text('General Admission'),
                      ),
                      DropdownMenuItem(value: 'vip', child: Text('VIP')),
                      DropdownMenuItem(
                        value: 'backstage',
                        child: Text('Backstage Pass'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _ticketType = value;
                      });
                    },
                    validator:
                        (value) =>
                            value == null
                                ? 'Please select a ticket type'
                                : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _pay(user, event),
                      child: const Text('Confirm Payment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _buildInput(String label, {TextInputType type = TextInputType.text}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8),
//     child: TextFormField(
//       decoration: InputDecoration(labelText: label),
//       keyboardType: type,
//       validator:
//           (value) =>
//               value == null || value.isEmpty ? 'This field is required' : null,
//     ),
//   );
// }

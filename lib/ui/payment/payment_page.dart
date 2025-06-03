import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_state_controller.dart';
import 'package:tickets_app/ui/my_purchases/providers/controller_ticket_provider.dart';
import 'package:tickets_app/ui/payment/provider/controller_provider.dart';
import 'package:tickets_app/ui/widgets/bottom_action_button.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class PaymentPage extends ConsumerStatefulWidget {
  final EventDetailed event;

  const PaymentPage(this.event, {super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  String? _ticketType;

  String _getTicketName(String? type) {
    switch (type) {
      case '1':
        return 'General';
      case '2':
        return 'Preferential';
      case '3':
        return 'VIP';
      default:
        return 'No ticket selected';
    }
  }

  int _getTicketPrice(String? type) {
    switch (type) {
      case '1':
        return 20;
      case '2':
        return 50;
      case '3':
        return 100;
      default:
        return 0;
    }
  }

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
    final ticketTypeState = ref.watch(
      ticketTypeControllerProvider(event.id.toString()),
    );

    ref.listen<TicketState>(paymentControllerProvider, (previous, next) {
      if (next.success) {
        context.go('/confirmation', extra: event);
      } else if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${next.errorMessage}')));
      }
    });

    String formattedDate =
        '${event.date.month}/${event.date.day}/${event.date.year}';

    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        label: 'Start payment',
        onPressed: () => _pay(user, event),
      ),
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.white,
      ),
      body:
          ticketTypeState.isLoading
              ? Loading()
              : ticketTypeState.errorMessage != null
              ? ErrorState(ticketTypeState.errorMessage!)
              : ticketTypeState.ticketType == null
              ? ErrorState('Something went wrong, please try again later')
              : SingleChildScrollView(
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
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
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
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Select Ticket Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Ticket Type',
                            ),
                            items: [
                              DropdownMenuItem(
                                value: '1',
                                enabled: ticketTypeState.ticketType!.basic > 0,
                                child: Text(
                                  'Tickets available: ${ticketTypeState.ticketType!.basic} - General',
                                ),
                              ),
                              DropdownMenuItem(
                                value: '2',
                                enabled:
                                    ticketTypeState.ticketType!.preferred > 0,
                                child: Text(
                                  'Tickets available: ${ticketTypeState.ticketType!.preferred} - Preferential',
                                ),
                              ),
                              DropdownMenuItem(
                                value: '3',
                                enabled: ticketTypeState.ticketType!.vip > 0,
                                child: Text(
                                  'Tickets available: ${ticketTypeState.ticketType!.vip} - VIP',
                                ),
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
                          SizedBox(height: 20),
                          _ticketType == null
                              ? SizedBox.shrink()
                              : Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Icon(
                                        Icons.sell,
                                        size: 42,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Buying: ',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${_getTicketName(_ticketType)} ',
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.headlineSmall,
                                              ),
                                              TextSpan(
                                                text: 'ticket',
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Price: \$${_getTicketPrice(_ticketType)}',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          // const SizedBox(height: 30),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     onPressed: () => _pay(user, event),
                          //     child: const Text('Confirm Payment'),
                          //   ),
                          // ),
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

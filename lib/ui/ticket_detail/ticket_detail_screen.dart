import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/ticket_detailed.dart';
import 'package:tickets_app/ui/widgets/bottom_action_button.dart';
import 'package:tickets_app/ui/widgets/tag.dart';

class TicketDetailScreen extends StatelessWidget {
  TicketDetailScreen({super.key})
    : ticket = TicketDetailed(
        id: 1,
        name: 'Jazz all night long',
        category: 'Concert',
        qrImageUrl: 'https://api.qrserver.com/v1/create-qr-code/?data=FKS1235A',
        date: DateTime(2025, 12, 12),
        code: 'FKS1235A',
        city: 'London, United Kingdom',
        address: '42 Camden High Street',
        type: 'VIP', // it may be early access, general, or VIP
        purchasedOn: DateTime(2025, 05, 12),
        ticketHolderName: 'Juan Valdés',
      );

  final TicketDetailed ticket;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        '${ticket.date.month}/${ticket.date.day}/${ticket.date.year}';

    String formattedDatePurchased =
        '${ticket.purchasedOn.month}/${ticket.purchasedOn.day}/${ticket.purchasedOn.year}';

    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        label: 'Download PDF',
        onPressed: () => {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Ticket details'),
        // elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  ticket.qrImageUrl,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Text('Code: ${ticket.code}'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    ticket.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 5),
                  Text(
                    ticket.city,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              size: 18,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ticket.address,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 18,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 8),
                            Text(
                              formattedDate,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        'Category:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Tag(label: ticket.category),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your ticket',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Ticket holder:',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ticket.ticketHolderName,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(Icons.confirmation_num),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Entry type:',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ticket.type,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Purchased on:',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                formattedDatePurchased,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

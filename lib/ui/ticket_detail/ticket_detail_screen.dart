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
        numberOfTickets: 2,
        ticketHolderName: 'Juan Valdés',
      );

  final TicketDetailed ticket;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        '${ticket.date.month}/${ticket.date.day}/${ticket.date.year}';

    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomActionButton(
        label: 'Download PDF',
        onPressed:
            () => context.pushNamed(
              //! TO DO: show a success message
              'payment',
              pathParameters: {
                'id':
                    ticket.id
                        .toString(), // make sure you're passing the correct ID
              },
            ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(ticket.qrImageUrl, fit: BoxFit.cover),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 15),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Text(
                    ticket.type,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

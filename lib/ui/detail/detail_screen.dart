import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/detail/provider/controller_event_detail_provider.dart';
import 'package:tickets_app/ui/widgets/bottom_action_button.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';
import 'package:tickets_app/ui/widgets/tag.dart';

class DetailScreen extends ConsumerWidget {
  final String eventId;

  const DetailScreen({super.key, required this.eventId});
  //   : eventState.event! = EventDetailed(
  //       date: DateTime(2025, 12, 12),
  //       category: 'Concert',
  //       id: 1,
  //       name: 'Jazz all night long',
  //       description:
  //           "Immerse yourself in a night of smooth rhythms and soulful melodies. Join us for Jazz All Night Long, an unforgettable evening filled with live performances by top jazz artists, warm ambiance, and timeless tunes. Whether you're a jazz enthusiast or simply looking for a unique night out, this eventState.event! promises elegant vibes, great company, and music that moves the soul.Sip your favorite drink, relax, and let the groove carry you through the night.",
  //       imageUrl:
  //           'https://images.squarespace-cdn.com/content/v1/62502cbe020d59057d88d958/080907e5-94d6-491d-9c60-3d8099731559/patterns-by-angry-jalebi-62.jpg',
  //       host: 'Alexander Pierce',
  //       hostPictureUrl:
  //           'https://static.wikia.nocookie.net/heroes-and-villain/images/9/9b/Pierce.png/revision/latest?cb=20190708112802',
  //       price: 15,
  //       city: 'London, United Kingdom',
  //       address: '42 Camden High Street',
  //     );

  // final EventDetailed eventState.event!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(eventDetailControllerProvider(eventId));

    if (eventState.event == null) {
      return Scaffold(
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
        body:
            eventState.isLoading
                ? Loading()
                : eventState.errorMessage != null
                ? ErrorState(eventState.errorMessage!)
                : EmptyState(),
      );
    }

    String formattedDate =
        '${eventState.event!.date.month}/${eventState.event!.date.day}/${eventState.event!.date.year}';

    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomActionButton(
        // label: 'Buy  |  \$${eventState.event!.price} / person',
        label: 'Buy tickets',
        onPressed:
            () => context.pushNamed(
              'payment',
              pathParameters: {'id': eventState.event!.id.toString()},
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
                  child: Image.network(
                    eventState.event!.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventState.event!.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 5),
                  Text(
                    eventState.event!.city,
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
                                eventState.event!.address,
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
                      Tag(label: eventState.event!.category),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16), // optional padding
                    decoration: BoxDecoration(
                      color: Colors.white, // white background
                      border: Border.all(
                        color: Colors.grey, // gray border
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // rounded corners
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipOval(
                            child: Image.network(
                              eventState.event!.hostPictureUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey[600],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Host',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              eventState.event!.host,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Text(
                    eventState.event!.description,
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

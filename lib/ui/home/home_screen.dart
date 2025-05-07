import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/theme/colors.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';
import 'package:tickets_app/ui/home/widgets/search_bar_events.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Event> items = [
    Event(
      date: DateTime(2025, 12, 12),
      category: 'Concert',
      id: 1,
      name: 'Jazz all night long',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/62502cbe020d59057d88d958/080907e5-94d6-491d-9c60-3d8099731559/patterns-by-angry-jalebi-62.jpg',
    ),
    Event(
      id: 2,
      name: 'Rock Concert',
      category: 'Concert',
      date: DateTime(2025, 5, 10),
      imageUrl:
          'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2?fit=crop&w=800&q=80',
    ),
    Event(
      id: 3,
      name: 'Theater Play',
      category: 'Theater',
      date: DateTime(2025, 6, 20),
      imageUrl:
          'https://images.unsplash.com/photo-1533236897111-3e94666b2edf?fit=crop&w=800&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_activity,
                    color: Theme.of(context).primaryColor,
                    size: 42,
                  ),
                  Text(
                    'YourTicket',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        GestureDetector(
                          onTap: () => context.go('/profile'),
                          child: SizedBox(
                            height: 45,
                            width: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(128.0),
                              child: Image.network(
                                'https://lh3.googleusercontent.com/a/ACg8ocKaAtVYDGLnqUdxtudN9p-VYaCT5iDkxwlTpIdcb1GKa6MWcF9F=s288-c-no', // Reemplaza con el enlace de tu imagen
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Discover unforgettable experiences',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 30),
              SearchBarEvents(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.push('/categories'),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Explore our categories',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: primarySwatch),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right,
                      color: primarySwatch,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Best events for you',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 5),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ), // similar a mainAxisSpacing
                    child: EventItem(event: items[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/provider/controller_provider.dart';
import 'package:tickets_app/theme/colors.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';
import 'package:tickets_app/ui/home/widgets/search_bar_events.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(eventListControllerProvider);

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
              eventState.isLoading
                  ? Loading()
                  : eventState.errorMessage != null
                  ? ErrorState(eventState.errorMessage!)
                  : eventState.listOfEvent.isEmpty
                  ? EmptyState()
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: eventState.listOfEvent.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ), // similar a mainAxisSpacing
                        child: EventItem(event: eventState.listOfEvent[index]),
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

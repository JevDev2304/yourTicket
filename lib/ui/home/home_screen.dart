import 'package:flutter/material.dart';
import 'package:tickets_app/ui/home/widgets/search_bar_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
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
                          size: 48,
                        ),
                        Text(
                          'YourTicket',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Discover unforgettable experiences',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SearchBarEvents(),
                  ],
                ))));
  }
}

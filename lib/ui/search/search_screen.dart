import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';
import 'package:tickets_app/ui/home/widgets/search_bar_events.dart';
import 'package:tickets_app/ui/search/providers/search_controller_provider.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class SearchScreen extends ConsumerWidget {
  final String query;

  const SearchScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(searchControllerProvider(query));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search'),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarEvents(),
            SizedBox(height: 15),
            Text(
              "Showing results for '$query'",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 45),
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
    );
  }
}

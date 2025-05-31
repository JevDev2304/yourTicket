import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';
import 'package:tickets_app/ui/search/providers/search_controller_provider.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class SearchByCategoryScreen extends ConsumerWidget {
  final String category;

  const SearchByCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(searchCategoryControllerProvider(category));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(category),
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
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
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

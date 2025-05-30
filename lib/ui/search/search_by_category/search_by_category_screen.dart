import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/ui/home/widgets/event_item.dart';

class SearchByCategoryScreen extends StatelessWidget {
  final String category;

  SearchByCategoryScreen({super.key, required this.category});

  final List<Event> items = [
    Event(
      date: DateTime(2025, 12, 12),
      category: 'Concert',
      id: 1,
      name: 'Jazz all night long',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/62502cbe020d59057d88d958/080907e5-94d6-491d-9c60-3d8099731559/patterns-by-angry-jalebi-62.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

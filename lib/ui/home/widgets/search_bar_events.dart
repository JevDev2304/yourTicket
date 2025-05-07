import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBarEvents extends StatelessWidget {
  const SearchBarEvents({super.key});

  @override
  Widget build(BuildContext context) {
    void onSubmit(String value) {
      if (value.trim().isNotEmpty) {
        final query = Uri.encodeComponent(value.trim());
        context.push('/search?q=$query');
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000), // subtle shadow
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium,

        onSubmitted: onSubmit,
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Find your next event...',
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

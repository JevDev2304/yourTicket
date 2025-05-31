import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/search/controllers/search_event_controller.dart';
import 'package:tickets_app/ui/search/controllers/search_event_state.dart';

final searchControllerProvider = StateNotifierProvider.family<
  SearchEventController,
  SearchEventState,
  String
>((ref, name) {
  final eventRepository = ref.watch(eventApiRepositoryProvider);
  final searchEventController = SearchEventController(eventRepository);
  // searchEventController.initialize();
  return searchEventController..getEventByName(name);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/search/controllers/category_controller.dart';
import 'package:tickets_app/ui/search/controllers/category_state.dart';
import 'package:tickets_app/ui/search/controllers/search_event_controller.dart';
import 'package:tickets_app/ui/search/controllers/search_event_state.dart';

final searchControllerProvider = StateNotifierProvider.family<
  SearchEventController,
  SearchEventState,
  String
>((ref, name) {
  final eventRepository = ref.watch(eventApiRepositoryProvider);
  final searchEventController = SearchEventController(eventRepository);
  return searchEventController..getEventByName(name);
});

final searchCategoryControllerProvider = StateNotifierProvider.family<
  SearchEventController,
  SearchEventState,
  String
>((ref, category) {
  final eventRepository = ref.watch(eventApiRepositoryProvider);
  final searchEventController = SearchEventController(eventRepository);
  return searchEventController..getEventByCategory(category);
});

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, CategoryState>((ref) {
      final eventRepository = ref.watch(eventApiRepositoryProvider);
      final categoryController = CategoryController(eventRepository);
      categoryController.initialize();
      return categoryController;
    });

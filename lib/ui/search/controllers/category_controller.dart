import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';
import 'package:tickets_app/ui/search/controllers/category_state.dart';

class CategoryController extends StateNotifier<CategoryState> {
  final EventRepository eventRepository;

  CategoryController(this.eventRepository) : super(CategoryState());

  Future<void> initialize() async {
    await getCategories();
  }

  Future<void> getCategories() async {
    state = state.copyWith(isLoading: true);
    try {
      final listOfCategories = await eventRepository.getEventCategories();
      state = state.copyWith(
        isLoading: false,
        listOfCategories: listOfCategories,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

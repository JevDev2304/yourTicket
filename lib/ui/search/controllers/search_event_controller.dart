import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';
import 'package:tickets_app/ui/search/controllers/search_event_state.dart';

class SearchEventController extends StateNotifier<SearchEventState> {
  final EventRepository eventRepository;

  SearchEventController(this.eventRepository) : super(SearchEventState());

  // Future<void> initialize() async {
  //   await getEventByName();
  // }

  Future<void> getEventByName(String name) async {
    state = state.copyWith(isLoading: true);
    try {
      final listOfEvent = await eventRepository.getEventByName(name);
      state = state.copyWith(isLoading: false, listOfEvent: listOfEvent);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

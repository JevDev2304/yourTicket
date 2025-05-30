import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/controller/event_list_state.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';

class EventListController extends StateNotifier<EventListState> {
  final EventRepository eventRepository;

  EventListController(this.eventRepository) : super(EventListState());

  Future<void> initialize() async {
    await getEventList();
  }

  Future<void> getEventList() async {
    state = state.copyWith(isLoading: true);
    try {
      final listOfEvent = await eventRepository.getEventList();
      state = state.copyWith(isLoading: false, listOfEvent: listOfEvent);
    } catch (error) {
      state = state.copyWith(isLoading: false);
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';
import 'package:tickets_app/ui/detail/controller/event_datail_state.dart';

class EventDetailController extends StateNotifier<EventDetailState> {
  final EventRepository eventRepository;

  EventDetailController(this.eventRepository) : super(EventDetailState());

  // Future<void> initialize() async {
  //   await getTicketDetail();
  // }

  Future<void> getEventDetails(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final event = await eventRepository.getEventDetails(id);
      state = state.copyWith(isLoading: false, event: event);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

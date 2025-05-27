import 'package:riverpod/riverpod.dart';
import 'package:tickets_app/controller/event_list_state.dart';
import 'package:tickets_app/data/repository/event_repository.dart';

class EventListController extends StateNotifier<EventListState> {
  final EventRepository eventRepository;

  EventListController(this.eventRepository) : super(EventListState());

  Future<void> initialize() async {
    await eventRepository.getEventList();
  }
}

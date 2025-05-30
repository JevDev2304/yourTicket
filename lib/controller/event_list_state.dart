import 'package:tickets_app/domain/model/event.dart';

class EventListState {
  final List<Event> listOfEvent;
  final bool isLoading;

  EventListState({this.listOfEvent = const [], this.isLoading = false});

  EventListState copyWith({List<Event>? listOfEvent, bool? isLoading}) {
    return EventListState(
      listOfEvent: listOfEvent ?? this.listOfEvent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

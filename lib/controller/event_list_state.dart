import 'package:tickets_app/domain/model/event.dart';

class EventListState {
  final List<Event> listOfEvent;

  EventListState({this.listOfEvent = const []});

  EventListState copyWith({List<Event>? listOfEvent}) {
    return EventListState(listOfEvent: listOfEvent ?? this.listOfEvent);
  }
}

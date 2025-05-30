import 'package:tickets_app/domain/model/event.dart';

class EventListState {
  final List<Event> listOfEvent;
  final bool isLoading;
  final String? errorMessage;

  EventListState({
    this.listOfEvent = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  EventListState copyWith({
    List<Event>? listOfEvent,
    bool? isLoading,
    String? errorMessage,
  }) {
    return EventListState(
      listOfEvent: listOfEvent ?? this.listOfEvent,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

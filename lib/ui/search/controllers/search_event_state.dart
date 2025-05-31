import 'package:tickets_app/domain/model/event.dart';

class SearchEventState {
  final List<Event> listOfEvent;
  final bool isLoading;
  final String? errorMessage;

  SearchEventState({
    this.listOfEvent = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  SearchEventState copyWith({
    List<Event>? listOfEvent,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SearchEventState(
      listOfEvent: listOfEvent ?? this.listOfEvent,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

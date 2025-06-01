import 'package:tickets_app/domain/model/event_detailed.dart';

class EventDetailState {
  final EventDetailed? event;
  final bool isLoading;
  final String? errorMessage;

  EventDetailState({this.event, this.isLoading = false, this.errorMessage});

  EventDetailState copyWith({
    EventDetailed? event,
    bool? isLoading,
    String? errorMessage,
  }) {
    return EventDetailState(
      event: event ?? this.event,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

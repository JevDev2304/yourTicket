import 'package:tickets_app/domain/model/ticket_detailed.dart';

class TicketDetailState {
  final TicketDetailed? ticket;
  final bool isLoading;
  final String? errorMessage;

  TicketDetailState({this.ticket, this.isLoading = false, this.errorMessage});

  TicketDetailState copyWith({
    TicketDetailed? ticket,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TicketDetailState(
      ticket: ticket ?? this.ticket,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

import 'package:tickets_app/domain/model/ticket.dart';

class TicketState {
  final List<Ticket> listOfTickets;
  final bool isLoading;
  final String? errorMessage;
  final bool success;

  TicketState({
    this.listOfTickets = const [],
    this.isLoading = false,
    this.errorMessage,
    this.success = false,
  });

  TicketState copyWith({
    List<Ticket>? listOfTickets,
    bool? isLoading,
    bool? success,
    String? errorMessage,
  }) {
    return TicketState(
      listOfTickets: listOfTickets ?? this.listOfTickets,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }
}

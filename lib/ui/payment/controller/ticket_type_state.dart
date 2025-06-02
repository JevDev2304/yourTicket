import 'package:tickets_app/domain/model/ticket_availability.dart';

class TicketTypeState {
  final TicketAvailability? ticketType;
  final bool isLoading;
  final String? errorMessage;

  TicketTypeState({this.ticketType, this.isLoading = false, this.errorMessage});

  TicketTypeState copyWith({
    TicketAvailability? ticketType,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TicketTypeState(
      ticketType: ticketType ?? this.ticketType,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

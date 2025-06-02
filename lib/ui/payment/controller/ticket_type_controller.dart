import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/ticket_repository.dart';
import 'package:tickets_app/ui/payment/controller/ticket_type_state.dart';

class TicketTypeController extends StateNotifier<TicketTypeState> {
  final TicketRepository ticketRepository;

  TicketTypeController(this.ticketRepository) : super(TicketTypeState());

  // Future<void> initialize() async {
  //   await getTicketList();
  // }

  Future<void> getTicketType(String eventId) async {
    state = state.copyWith(isLoading: true);
    try {
      final ticketType = await ticketRepository.getTicketAvailability(eventId);
      state = state.copyWith(isLoading: false, ticketType: ticketType);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

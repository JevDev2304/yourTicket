import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/ticket_repository.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_state_controller.dart';

class TicketController extends StateNotifier<TicketState> {
  final TicketRepository ticketRepository;

  TicketController(this.ticketRepository) : super(TicketState());

  Future<void> reset(String email) async {
    await getTicketList(email);
  }

  Future<void> getTicketList(String email) async {
    state = state.copyWith(isLoading: true);
    try {
      final listOfTickets = await ticketRepository.getUserTickets(email);
      state = state.copyWith(isLoading: false, listOfTickets: listOfTickets);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  Future<void> payment(String email, String eventId, String ticketType) async {
    state = state.copyWith(isLoading: true, success: false);
    try {
      await ticketRepository.payment(email, eventId, ticketType);
      state = state.copyWith(success: true);
      await getTicketList(email);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

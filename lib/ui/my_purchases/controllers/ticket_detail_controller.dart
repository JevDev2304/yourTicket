import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/ticket_repository.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_detail_state.dart';

class TicketDetailController extends StateNotifier<TicketDetailState> {
  final TicketRepository ticketRepository;

  TicketDetailController(this.ticketRepository) : super(TicketDetailState());

  // Future<void> initialize() async {
  //   await getTicketDetail();
  // }

  Future<void> getTicketDetail(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final ticket = await ticketRepository.getTicketDetail(id);
      state = state.copyWith(isLoading: false, ticket: ticket);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}

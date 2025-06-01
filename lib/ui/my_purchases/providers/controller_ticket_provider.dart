import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_controller.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_detail_controller.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_detail_state.dart';
import 'package:tickets_app/ui/my_purchases/controllers/ticket_state_controller.dart';

final ticketControllerProvider =
    StateNotifierProvider<TicketController, TicketState>((ref) {
      final ticketRepository = ref.watch(ticketApiRepositoryProvider);
      final ticketListController = TicketController(ticketRepository);
      ticketListController.initialize();
      return ticketListController;
    });

final ticketDetailControllerProvider = StateNotifierProvider.family<
  TicketDetailController,
  TicketDetailState,
  String
>((ref, id) {
  final ticketRepository = ref.watch(ticketApiRepositoryProvider);
  final ticketDetailController = TicketDetailController(ticketRepository);
  return ticketDetailController..getTicketDetail(id);
});

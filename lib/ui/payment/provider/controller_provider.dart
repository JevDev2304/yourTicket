import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/payment/controller/ticket_type_controller.dart';
import 'package:tickets_app/ui/payment/controller/ticket_type_state.dart';

final ticketTypeControllerProvider =
    StateNotifierProvider.family<TicketTypeController, TicketTypeState, String>(
      (ref, eventId) {
        final ticketRepository = ref.watch(ticketApiRepositoryProvider);
        final ticketController = TicketTypeController(ticketRepository);
        return ticketController..getTicketType(eventId);
      },
    );

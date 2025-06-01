import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/detail/controller/event_datail_state.dart';
import 'package:tickets_app/ui/detail/controller/event_detail_controller.dart';

final eventDetailControllerProvider =
    StateNotifierProvider.family<EventDetailController, EventDetailState, int>((
      ref,
      id,
    ) {
      final eventRepository = ref.watch(eventApiRepositoryProvider);
      final eventDetailController = EventDetailController(eventRepository);
      return eventDetailController..getEventDetails(id);
    });

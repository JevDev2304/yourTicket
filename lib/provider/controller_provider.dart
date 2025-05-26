import 'package:riverpod/riverpod.dart';
import 'package:tickets_app/controller/even_list_controller.dart';
import 'package:tickets_app/controller/event_list_state.dart';
import 'package:tickets_app/provider/repository_provider.dart';

final eventListControllerProvider =
    StateNotifierProvider<EventListController, EventListState>((ref) {
      final eventRepository = ref.watch(eventApiRepositoryProvider);
      final eventListController = EventListController(eventRepository);
      eventListController.initialize();
      return eventListController;
    });

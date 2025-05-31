import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/data/datasource/event_api_datasource.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';

final eventApiRepositoryProvider = Provider<EventRepository>((ref) {
  final eventApiDatasource = EventApiDatasource();
  final eventApiRepository = EventRepository(eventApiDatasource);
  return eventApiRepository;
});

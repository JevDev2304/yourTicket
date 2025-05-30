import 'package:tickets_app/domain/datasource/event_datasource.dart';
import 'package:tickets_app/domain/model/event.dart';

class EventRepository {
  final EventDatasource _eventDatasource;

  EventRepository(this._eventDatasource);

  Future<List<Event>?> getEventList() {
    return _eventDatasource.fetchEventList();
  }
}

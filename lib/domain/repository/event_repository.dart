import 'package:tickets_app/domain/datasource/event_datasource.dart';
import 'package:tickets_app/domain/model/category.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';

class EventRepository {
  final EventDatasource _eventDatasource;

  EventRepository(this._eventDatasource);

  Future<List<Event>?> getEventList() {
    return _eventDatasource.fetchEventList();
  }

  Future<List<Event>?> getEventByName(String name) {
    return _eventDatasource.fetchEventByName(name);
  }

  Future<List<Event>?> getEventByCategory(String category) {
    return _eventDatasource.fetchEventByCategory(category);
  }

  Future<EventDetailed?> getEventDetails(String id) {
    return _eventDatasource.fetchEventDetails(id);
  }

  Future<List<Category>?> getEventCategories() {
    return _eventDatasource.fetchEventCategories();
  }
}

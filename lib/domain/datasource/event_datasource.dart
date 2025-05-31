import 'package:tickets_app/domain/model/category.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';

abstract class EventDatasource {
  Future<List<Event>?> fetchEventList();
  Future<List<Event>?> fetchEventByName(String name);
  Future<List<Event>?> fetchEventByCategory(String category);
  Future<EventDetailed?> fetchEventDetails(int id);
  Future<List<Category>?> fetchEventCategories();
}

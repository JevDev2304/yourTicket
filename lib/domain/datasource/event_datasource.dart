import 'package:tickets_app/domain/model/event.dart';

abstract class EventDatasource {
  Future<List<Event>?> fetchEventList();
}

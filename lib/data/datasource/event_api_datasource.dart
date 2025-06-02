import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/constants/app_constants.dart';
import 'package:tickets_app/domain/datasource/event_datasource.dart';
import 'package:tickets_app/domain/model/category.dart';
import 'package:tickets_app/domain/model/event.dart';
import 'package:tickets_app/domain/model/event_detailed.dart';
import 'package:tickets_app/domain/model/ticket_type.dart';

class EventApiDatasource extends EventDatasource {
  @override
  Future<List<Event>?> fetchEventList() async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/events/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body) as List;
        final eventList =
            listOfJson.map((json) => Event.fromJson(json)).toList();
        return eventList;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<Event>?> fetchEventByCategory(String category) async {
    final url = Uri.https(
      AppConstants.apiBaseUrl,
      '/api/events/category/$category',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body) as List;
        final eventList =
            listOfJson.map((json) => Event.fromJson(json)).toList();
        return eventList;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<Event>?> fetchEventByName(String name) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/events/name/$name');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body) as List;
        final eventList =
            listOfJson.map((json) => Event.fromJson(json)).toList();
        return eventList;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<Category>?> fetchEventCategories() async {
    // TODO: implement fetchEventCategories
    throw UnimplementedError();
  }

  @override
  Future<EventDetailed?> fetchEventDetails(String id) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/events/$id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final event = EventDetailed.fromJson(json);
        // json.map((json) => Event.fromJson(json)).toList();
        return event;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<TicketType>?> fetchEventTicketTypes(int eventId) {
    // TODO: implement fetchEventTicketTypes
    throw UnimplementedError();
  }
}

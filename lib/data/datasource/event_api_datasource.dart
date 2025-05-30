import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/constants/app_constants.dart';
import 'package:tickets_app/domain/datasource/event_datasource.dart';
import 'package:tickets_app/domain/model/event.dart';

class EventApiDatasource extends EventDatasource {
  @override
  Future<List<Event>?> fetchEventList() async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/events/');

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body) as List;
        final eventList =
            listOfJson.map((json) => Event.fromJson(json)).toList();
        return eventList;
      } else {
        throw Exception('No existen eventos');
      }
    } catch (error) {
      throw Exception('Ocurrió un error procesando los datos del API');
    }
  }
}

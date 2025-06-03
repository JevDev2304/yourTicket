import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickets_app/constants/app_constants.dart';
import 'package:tickets_app/domain/datasource/ticket_datasource.dart';
import 'package:tickets_app/domain/model/ticket.dart';
import 'package:tickets_app/domain/model/ticket_availability.dart';
import 'package:tickets_app/domain/model/ticket_detailed.dart';

class TicketApiDatasource extends TicketDatasource {
  @override
  Future<TicketDetailed?> fetchTicketDetail(String id) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/tickets/$id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final ticket = TicketDetailed.fromJson(json);
        return ticket;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<Ticket>?> fetchUserTickets(String email) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/tickets/user/$email');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body) as List;
        final ticketList =
            listOfJson.map((json) => Ticket.fromJson(json)).toList();
        return ticketList;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<void> payment(String email, String eventId, String ticketType) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/tickets/pay');

    final body = {
      'email': email,
      'eventId': eventId,
      'ticketTypeId': ticketType,
    };

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<TicketAvailability?> fetchTicketAvailability(String eventId) async {
    final url = Uri.https(
      AppConstants.apiBaseUrl,
      '/api/tickets/availability/$eventId',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final event = TicketAvailability.fromJson(json);
        // json.map((json) => Event.fromJson(json)).toList();
        return event;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }
}

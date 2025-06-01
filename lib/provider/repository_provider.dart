import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/data/datasource/event_api_datasource.dart';
import 'package:tickets_app/data/datasource/firebase_datasourcer.dart';
import 'package:tickets_app/data/datasource/profile_api_datasource.dart';
import 'package:tickets_app/data/datasource/ticket_api_datasource.dart';
import 'package:tickets_app/data/repository/auth_repository.dart';
import 'package:tickets_app/domain/repository/event_repository.dart';
import 'package:tickets_app/domain/repository/profile_repository.dart';
import 'package:tickets_app/domain/repository/ticket_repository.dart';

final eventApiRepositoryProvider = Provider<EventRepository>((ref) {
  final eventApiDatasource = EventApiDatasource();
  final eventApiRepository = EventRepository(eventApiDatasource);
  return eventApiRepository;
});

final ticketApiRepositoryProvider = Provider<TicketRepository>((ref) {
  final ticketApiDatasource = TicketApiDatasource();
  final ticketApiRepository = TicketRepository(ticketApiDatasource);
  return ticketApiRepository;
});

final profileApiRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileApiDatasource = ProfileApiDatasource();
  final profileApiRepository = ProfileRepository(profileApiDatasource);
  return profileApiRepository;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = FirebaseDatasource(FirebaseAuth.instance);
  final authRepository = AuthRepository(authDatasource);
  return authRepository;
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

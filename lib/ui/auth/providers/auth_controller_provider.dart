import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/ui/auth/controllers/auth_contoller.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  () => AuthController(),
);

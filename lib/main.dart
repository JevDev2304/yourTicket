import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'my_purchases_page.dart';
import 'payment_confirmation_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourTicket',
      theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5E35B1)),
  primaryColor: Color(0xFF5E35B1),
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF5F5F5),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF5E35B1),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  useMaterial3: true,
),

      debugShowCheckedModeBanner: false,
      initialRoute: '/payment',
      routes: {
        '/payment': (context) => PaymentPage(),
        '/my_purchases': (context) => const MyPurchasesPage(),
        '/confirmation': (context) => const PaymentConfirmationPage(),
      },
    );
  }
}

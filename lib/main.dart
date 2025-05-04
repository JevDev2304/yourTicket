import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tickets_app/ui/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YourTicket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFfcd240)),
        primaryColor: Color(0xFFfcd240),
        textTheme: GoogleFonts.urbanistTextTheme(),
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
            backgroundColor: Color(0xFFfcd240),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
      // initialRoute: '/payment',
      // routes: {
      //   '/payment': (context) => PaymentPage(),
      //   '/my_purchases': (context) => const MyPurchasesPage(),
      //   '/confirmation': (context) => const PaymentConfirmationPage(),
      // },

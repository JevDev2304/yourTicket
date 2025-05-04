import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/home/home_screen.dart';
import 'package:tickets_app/ui/my_purchases/my_purchases_page.dart';
import 'package:tickets_app/ui/payment/payment_page.dart';
import 'package:tickets_app/ui/payment_confirmation/payment_confirmation_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/payment',
      name: 'payment',
      builder: (BuildContext context, GoRouterState state) {
        return PaymentPage();
      },
    ),
    GoRoute(
      path: '/my_purchases',
      name: 'my_purchases',
      builder: (BuildContext context, GoRouterState state) {
        return MyPurchasesPage();
      },
    ),
    GoRoute(
      path: '/confirmation',
      name: 'confirmation',
      builder: (BuildContext context, GoRouterState state) {
        return PaymentConfirmationPage();
      },
    ),
  ],
);
        // routes: [
        //   GoRoute(
        //     path: '/recipeDetail/:id',
        //     name: 'recipeDetail',
        //     builder: (BuildContext context, GoRouterState state) {
        //       final String? id = state.pathParameters['id'];
        //       return RecipeDetailScreen(id: id);
        //     },
        //   ),
        // ]),

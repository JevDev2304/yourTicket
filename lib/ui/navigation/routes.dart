import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/categories/categories_screen.dart';
import 'package:tickets_app/ui/detail/detail_screen.dart';
import 'package:tickets_app/ui/home/home_screen.dart';
import 'package:tickets_app/ui/my_purchases/my_purchases_page.dart';
import 'package:tickets_app/ui/navigation/widgets/main_scaffold.dart';
import 'package:tickets_app/ui/payment/payment_page.dart';
import 'package:tickets_app/ui/payment_confirmation/payment_confirmation_page.dart';
import 'package:tickets_app/ui/login/login_screen.dart';
import 'package:tickets_app/ui/profile/profile_screen.dart';
import 'package:tickets_app/ui/register/register_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
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
        GoRoute(
          path: '/categories',
          name: 'categories',
          builder: (BuildContext context, GoRouterState state) {
            return CategoriesScreen();
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return ProfileScreen();
          },
        ),

        GoRoute(
          path: '/event/:id',
          name: 'event',
          builder: (BuildContext context, GoRouterState state) {
            // final String? userId = state.pathParameters['id'];
            return DetailScreen();
          },
          routes: [
            GoRoute(
              path: 'payment',
              name: 'payment',
              builder: (BuildContext context, GoRouterState state) {
                return PaymentPage();
              },
            ),
          ],
        ),
        //GoRoute(
        //path: '/profile/:id',
        //name: 'profile',
        //builder: (BuildContext context, GoRouterState state) {
        //final String? userId = state.pathParameters['id'];
        //return ProfileScreen(userId: userId);
        //},
        //),
      ],
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

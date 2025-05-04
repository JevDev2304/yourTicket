import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    // GoRoute(
    //     path: '/home',
    //     name: 'home',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const HomeScreen();
    //     },
    //     routes: [
    //       GoRoute(
    //         path: '/recipeDetail/:id',
    //         name: 'recipeDetail',
    //         builder: (BuildContext context, GoRouterState state) {
    //           final String? id = state.pathParameters['id'];
    //           return RecipeDetailScreen(id: id);
    //         },
    //       ),
    //     ]),
  ],
);

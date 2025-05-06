// main_scaffold.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/theme/colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  int _getIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/my_purchases')) return 1;
    if (location.startsWith('/profile')) return 2;
    if (location.startsWith('/categories')) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/my_purchases');
        break;
      case 2:
        context.go('/profile');
        break;
      case 3:
        context.go('/categories');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(context, index),
        backgroundColor: Colors.white,
        iconSize: 28,
        selectedItemColor: primarySwatch[500],
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'My purchases',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

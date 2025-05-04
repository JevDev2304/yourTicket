import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_activity,
              color: Theme.of(context).primaryColor,
              size: 72,
            ),
            const SizedBox(height: 20),
            Text(
              'Sign Up to YourTicket',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Email Address',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Complete Name',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: ' Confirm Password',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print('Register Button Pressed');
                context.go('/home');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

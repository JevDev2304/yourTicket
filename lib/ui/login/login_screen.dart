import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
              'Welcome to YourTicket',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                filled: true, // Habilita el llenado del fondo
                fillColor: Colors.white, // Establece el color de fondo a blanco
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true, // Habilita el llenado del fondo
                fillColor: Colors.white, // Establece el color de fondo a blanco
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      print('Login Button Pressed');
                      context.go('/home');
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    // Usamos ElevatedButton para la misma forma
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Fondo blanco para el botón Sign Up
                      foregroundColor:
                          Theme.of(
                            context,
                          ).primaryColor, // Texto con tu color primario
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ), // Borde con tu color primario
                    ),
                    onPressed: () {
                      context.go('/register');
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

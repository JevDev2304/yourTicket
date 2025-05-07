import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Styled event ticket
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.squarespace-cdn.com/content/v1/62502cbe020d59057d88d958/080907e5-94d6-491d-9c60-3d8099731559/patterns-by-angry-jalebi-62.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 180,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jazz Night at Main Theater',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'May 25, 2025 • Main Theater',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Customer Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildInput('Full Name'),
                  _buildInput('Email', type: TextInputType.emailAddress),
                  _buildInput('Phone', type: TextInputType.phone),
                  _buildInput('Address'),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select a payment method',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'credit_card',
                        child: Text('Credit Card'),
                      ),
                      DropdownMenuItem(
                        value: 'debit_card',
                        child: Text('Debit Card'),
                      ),
                      DropdownMenuItem(value: 'pse', child: Text('PSE')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  _buildInput(
                    'Card or Account Number',
                    type: TextInputType.number,
                  ),
                  _buildInput('ZIP Code', type: TextInputType.number),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/confirmation');
                        // TODO this must be uncommented in the second phase of development
                        // if (_formKey.currentState!.validate()) {
                        //   Navigator.pushNamed(context, '/confirmation');
                        // }
                      },
                      child: const Text('Confirm Payment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: type,
        validator:
            (value) =>
                value == null || value.isEmpty
                    ? 'This field is required'
                    : null,
      ),
    );
  }
}

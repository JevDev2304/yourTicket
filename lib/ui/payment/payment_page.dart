import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago del Evento'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DETALLES DEL EVENTO
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Nombre del Evento',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Fecha: 25 de mayo, 2025'),
                          Text('Lugar: Teatro Principal'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text('Información del Cliente',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildInput('Nombre completo'),
                  _buildInput('Email', type: TextInputType.emailAddress),
                  _buildInput('Teléfono', type: TextInputType.phone),
                  _buildInput('Dirección'),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Método de Pago',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Selecciona método de pago',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'credit_card', child: Text('Tarjeta de crédito')),
                      DropdownMenuItem(value: 'debit_card', child: Text('Tarjeta de débito')),
                      DropdownMenuItem(value: 'pse', child: Text('PSE')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  _buildInput('Número de tarjeta o cuenta', type: TextInputType.number),
                  _buildInput('ZIP Code', type: TextInputType.number),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/confirmation');
                        }
                      },
                      child: const Text('Confirmar Pago'),
                    ),
                  )
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
        validator: (value) => value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
      ),
    );
  }
}

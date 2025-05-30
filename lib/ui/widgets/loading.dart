import 'package:flutter/material.dart';
import 'package:tickets_app/theme/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: CircularProgressIndicator(color: primarySwatch),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BiometricsValueScreen extends StatelessWidget {
  const BiometricsValueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometrics Success"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 150,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
              textAlign: TextAlign.center,
              "You have successfully authenticated using fingerprint biometrics"),
        ],
      ),
    );
  }
}

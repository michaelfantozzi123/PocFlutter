import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:poc_flutter/screens/biometrics_value_screen.dart';

class BiometricsScreen extends StatefulWidget {
  const BiometricsScreen({super.key});

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = false;
  bool authenticated = false;

  void _authenticate() async {
    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(
              useErrorDialogs: false, stickyAuth: true));

      if (authenticated) {
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BiometricsValueScreen()));
        }
      }
    } catch (e) {
      debugPrint("error using biometric auth: $e");
    }

    debugPrint("authenticated: $authenticated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometrics Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.fingerprint,
              color: Theme.of(context).primaryColor,
              size: 150,
            ),
          ),
          const SizedBox(height: 16),
          const Text("Click to authenticate using biometrics"),
          FutureBuilder<bool>(
            future: auth.canCheckBiometrics,
            builder: (context, value) => value.data == false
                ? const Text("Biometrics not supported or enabled")
                : ElevatedButton(
                    onPressed: _authenticate, child: const Text("Auth")),
          ),
        ],
      ),
    );
  }
}

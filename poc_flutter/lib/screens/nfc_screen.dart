import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:poc_flutter/screens/nfc_value.dart';

class NFCScreen extends StatefulWidget {
  const NFCScreen({super.key});

  @override
  State<NFCScreen> createState() => _NFCScreenState();
}

class _NFCScreenState extends State<NFCScreen> {
  void _alert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  void _readTag() {
    bool isSuccess = false;
    String value = '';
    _alert("Listening...");

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      isSuccess = true;
      value = jsonEncode(tag.data);
      NfcManager.instance.stopSession();
      _alert("Stopped");
      if (isSuccess) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => NfcValueScreen(
                  value: value,
                )),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NFC Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.nfc,
              color: Theme.of(context).primaryColor,
              size: 150,
            ),
          ),
          const SizedBox(height: 16),
          const Text("Hold your device against the phone to trigger NFC"),
          FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => _getNFCWidgets(ss.data!),
          ),
        ],
      ),
    );
  }

  Widget _getNFCWidgets(bool isAvailable) {
    if (isAvailable) {
      return ElevatedButton(onPressed: _readTag, child: Text("Read NFC"));
    } else {
      if (Platform.isIOS) {
        return const Text("Your device does not support nfc");
      } else {
        return const Text(
            "Your device does not support nfc or it is turned of f");
      }
    }
  }
}

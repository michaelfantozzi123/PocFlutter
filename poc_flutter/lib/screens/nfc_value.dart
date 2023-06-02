import 'package:flutter/material.dart';

class NfcValueScreen extends StatelessWidget {
  const NfcValueScreen({super.key, required this.value});

  final String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC Value"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(15),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
          child: Column(children: [
            Text(
              "NFC Details",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 12),
            Text(value, softWrap: true, maxLines: 8, overflow: TextOverflow.ellipsis,) 
          ]),
        ),
      ),
    );
  }
}

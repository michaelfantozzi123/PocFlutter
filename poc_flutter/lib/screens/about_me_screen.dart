import 'package:flutter/material.dart';
import 'package:poc_flutter/widgets/main_drawer.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About me")),
      drawer: const MainDrawer(),
    );
  }
}

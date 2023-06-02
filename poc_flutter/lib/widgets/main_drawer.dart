import 'package:flutter/material.dart';
import 'package:poc_flutter/screens/about_me_screen.dart';
import 'package:poc_flutter/screens/home_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.kerridgecs.co.za/files/ocw/kcs_logo_211_x_95_white_bg.png',
                width: 150,
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          title: Text("Home Page"),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AboutMeScreen()));
          },
          title: Text("About Me Page"),
        ),
      ]),
    );
  }
}

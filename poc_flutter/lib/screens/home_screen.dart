import 'package:flutter/material.dart';
import 'package:poc_flutter/screens/biometrics_screen.dart';
import 'package:poc_flutter/screens/bonus_screen.dart';
import 'package:poc_flutter/screens/chart_screen.dart';
import 'package:poc_flutter/screens/nfc_screen.dart';
import 'package:poc_flutter/screens/qr_screen.dart';
import 'package:poc_flutter/widgets/home_card._widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://www.kerridgecs.co.za/files/ocw/kcs_logo_211_x_95_white_bg.png',
          width: 100,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Proof of concept",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView(
              padding: const EdgeInsetsDirectional.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                HomeCard(
                    title: 'Pie Chart',
                    icon: Icons.stacked_line_chart,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const ChartScreen())));
                    }),
                HomeCard(
                    title: 'NFC',
                    icon: Icons.nfc,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const NFCScreen())));
                    }),
                HomeCard(
                    title: 'Biometrics',
                    icon: Icons.fingerprint,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const BiometricsScreen())));
                    }),
                HomeCard(
                    title: 'QR Code',
                    icon: Icons.qr_code,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const QRScreen())));
                    }),
                HomeCard(
                    title: 'Bonus Stuff',
                    icon: Icons.star,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const BonusScreen())));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

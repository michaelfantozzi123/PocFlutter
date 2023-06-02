import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon),
          const SizedBox(height: 8),
          Text(title),
        ]),
      ),
    );
  }
}

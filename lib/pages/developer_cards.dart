import 'package:flutter/material.dart';
import 'package:simple_football/Components/icon_card.dart';

class DeveloperCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: PageView(
          children: [
            IconCard(
              color: Colors.orange,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.green,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.redAccent,
              iconData: Icons.add_to_home_screen,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
            ),
            IconCard(
              color: Colors.orange,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.green,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
            ),
            IconCard(
              color: Colors.redAccent,
              iconData: Icons.add_to_home_screen,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
            )
          ],
        ),
      ),
    ));
  }
}
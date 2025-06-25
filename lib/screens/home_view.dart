import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vipin_assessment/theme/text_styles.dart';
import 'package:vipin_assessment/widget/custom/home_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome Back',
              style: TextStyles.white25ExtraBold,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: const [
              HomeButton(
                icon: Icons.qr_code_scanner,
                label: 'Scan Employee',
              ),
              HomeButton(
                icon: Icons.flag,
                label: 'Flagged Events',
              ),
              HomeButton(
                icon: Icons.flight_takeoff,
                label: 'Employee Time Off',
              ),
              HomeButton(
                icon: Symbols.distance,
                label: 'Add Employees for Manual Clocking',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

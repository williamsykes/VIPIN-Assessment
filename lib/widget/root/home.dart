import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vipin_assessment/screens/home_view.dart';
import 'package:vipin_assessment/theme/colors.dart';
import 'package:vipin_assessment/theme/text_styles.dart';
import 'package:vipin_assessment/widget/custom/googleNav/google_nav_bar.dart';
import 'package:vipin_assessment/widget/custom/gradient_border.dart';
import 'package:vipin_assessment/widget/custom/home_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    Center(
      child: Text(
        'Timesheets',
        style: TextStyles.white15ExtraBold,
      ),
    ),
    Center(
      child: Text(
        'Employees',
        style: TextStyles.white15ExtraBold,
      ),
    ),
    Center(
      child: Text(
        'Menu',
        style: TextStyles.white15ExtraBold,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  Text(
                    'Time Gen',
                    style: TextStyles.offwhite28ExtraBold,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Main content
            Expanded(
              child: GradientBorderContainer(
                allowLeft: false,
                allowBottom: false,
                allowRight: false,
                borderGradient: const LinearGradient(
                  colors: [
                    CustomColors.primary,
                    CustomColors.primaryDark,
                  ],
                ),
                radius: 32,
                borderWidth: 4,
                contentPadding: const EdgeInsets.only(top: 4),
                content: _pages[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GradientBorderContainer(
          color: CustomColors.grey,
          borderGradient: const LinearGradient(
            colors: [
              CustomColors.primary,
              CustomColors.primaryDark,
            ],
          ),
          radius: 32,
          borderWidth: 4,
          content: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: CustomColors.dark,
            iconSize: 40,
            tabBackgroundGradient: const LinearGradient(
              colors: [
                CustomColors.primary,
                CustomColors.primaryDark,
              ],
            ),
            tabShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'HOME',
              ),
              GButton(
                icon: Icons.calendar_today,
                text: 'TIMESHEETS',
              ),
              GButton(
                icon: Icons.people,
                text: 'EMPLOYEES',
              ),
              GButton(
                icon: Icons.dashboard,
                text: 'MENU',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

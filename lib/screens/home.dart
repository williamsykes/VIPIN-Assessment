import 'package:flutter/material.dart';
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
    Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome Back',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
                icon: Icons.person_add,
                label: 'Add Employees for Manual Clocking',
              ),
            ],
          ),
        ),
      ],
    ),
    const Center(
        child: Text('Timesheets', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Employees', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Menu', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  const Text(
                    'Time Gen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
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
                    Color(0xFF00DAE7),
                    Color(0xFF0079A8),
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
          color: const Color(0xFF3D3D3D),
          borderGradient: const LinearGradient(
            colors: [
              Color(0xFF00DAE7),
              Color(0xFF0079A8),
            ],
          ),
          radius: 32,
          borderWidth: 4,
          content: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundGradient: const LinearGradient(
              colors: [
                Color(0xFF00DAE7),
                Color(0xFF0079A8),
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

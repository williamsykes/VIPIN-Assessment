import 'package:flutter/material.dart';

class FancyNavBar extends StatefulWidget {
  const FancyNavBar({super.key});

  @override
  State<FancyNavBar> createState() => _FancyNavBarState();
}

class _FancyNavBarState extends State<FancyNavBar> {
  int selectedIndex = 0;

  final items = [
    {'icon': Icons.home, 'label': 'HOME'},
    {'icon': Icons.calendar_today, 'label': 'TIMESHEETS'},
    {'icon': Icons.people, 'label': 'EMPLOYEES'},
    {'icon': Icons.dashboard, 'label': 'MENU'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF3D3D3D),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          width: 3,
          color: Colors.cyanAccent,
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Sliding background pill
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment(
              -1.0 + (selectedIndex * 2 / (items.length - 1)),
              0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / items.length - 16,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00DAE7),
                    Color(0xFF0079A8),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          // Nav items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: isSelected ? Colors.black : Colors.white,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

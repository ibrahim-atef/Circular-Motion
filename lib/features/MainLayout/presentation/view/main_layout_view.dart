import 'package:flutter/material.dart';
import '../../../MyDeals/presentation/view/my_deals_screen.dart';

class MainLayoutScreenView extends StatefulWidget {
  const MainLayoutScreenView({super.key});

  @override
  State<MainLayoutScreenView> createState() => _MainLayoutScreenViewState();
}

class _MainLayoutScreenViewState extends State<MainLayoutScreenView> {
  int _selectedIndex = 3;

  final List<Widget> _screens = [
    Center(child: Text("More Screen")),
    Center(child: Text("Account Screen")),
    Center(child: Text("Wallet Screen")),
    MyDealsScreen(),
    Center(child: Text("Home Screen")),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff1007FA),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          _navItem('assets/icons/BottomNavIcons/menu-deep.png', "المزيد", 0),
          _navItem('assets/icons/BottomNavIcons/acc.png', "حسابي", 1),
          _navItem('assets/icons/BottomNavIcons/wallet.png', "محفظتي", 2),
          _navItem('assets/icons/BottomNavIcons/dealup.png', "صفقاتي", 3),
          _navItem('assets/icons/BottomNavIcons/home.png', "الرئيسية", 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navItem(String asset, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            height: 3,

            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: _selectedIndex == index ? const Color(0xff1007FA) : Colors.transparent,

            ),
          ),
          Image.asset(
            asset,
            width: 24,
            height: 24,
            color: _selectedIndex == index ? const Color(0xff1007FA) : Colors.black,
          ),
        ],
      ),
      label: label,
    );
  }
}

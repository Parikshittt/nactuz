import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you import flutter_svg package
import '../home_page_screens/home_screen.dart';
import '../media.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _BottomNavigationToHomePageState();
}

class _BottomNavigationToHomePageState extends State<HomePage> {
  final List<Widget> _appScreens = const [
    HomeScreen(),
    Center(child: Text('Page 2 : Test')),
    Center(child: Text('Page 3 : Analysis')),
    Center(child: Text('Page 4 : Doubts')),
    Center(child: Text('Page 5 : One On One')),
  ];

  int _selectedIconIndex = 0;

  void _bottomNavBarButtonTapped(int index) {
    setState(() {
      _selectedIconIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _appScreens[_selectedIconIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: NavigationBar(
            destinations: _buildNavigationDestinations(),
            selectedIndex: _selectedIconIndex,
            onDestinationSelected: _bottomNavBarButtonTapped,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  List<NavigationDestination> _buildNavigationDestinations() {
    return [
      NavigationDestination(
        icon: SvgPicture.asset(AppMedia.homeRegular),
        label: 'Home',
        selectedIcon: SvgPicture.asset(AppMedia.homeFilled),
      ),
      NavigationDestination(
        icon: SvgPicture.asset(AppMedia.profileRegular),
        label: 'Profile',
        selectedIcon: SvgPicture.asset(AppMedia.profileFilled),
      ),
      NavigationDestination(
        icon: SvgPicture.asset(AppMedia.chatRegular),
        label: 'Chat',
        selectedIcon: SvgPicture.asset(AppMedia.chatFilled),
      ),
    ];
  }
}

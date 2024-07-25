import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nactuz_flutter/media.dart';

import 'package:nactuz_flutter/mock_test_screens/mock_tests_list.dart';


class MockTests extends StatefulWidget {
  const MockTests({super.key});

  @override
  State<MockTests> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<MockTests> {
  final appScreens = [
    const MockTestsList(),
    const Center(child: Text('Page 3 : Analysis')),
    const Center(child: Text('Page 4 : Doubts')),
    const Center(child: Text('Page 5 : One On One'))
  ];

  int _selectedIconIndex = 0;

  void _bottomNavBarButtonTapped(int index) {
    if (index == 3) {
      setState(() {
        _selectedIconIndex = 0;
        Navigator.pushNamed(context, '/');
      });
    } else {
      setState(() {
        _selectedIconIndex = index;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 0))
        ]),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AppMedia.testRegular),
                label: 'Book',
                selectedIcon: SvgPicture.asset(AppMedia.testFilled)),
            NavigationDestination(
                icon: SvgPicture.asset(AppMedia.upcomingRegular),
                label: 'Upcoming',
                selectedIcon: SvgPicture.asset(AppMedia.upcomingFilled)),
            NavigationDestination(
                icon: SvgPicture.asset(AppMedia.doubtsRegular),
                label: 'History',
                selectedIcon: SvgPicture.asset(AppMedia.doubtsFilled)),
            NavigationDestination(
                icon: SvgPicture.asset(AppMedia.goBackRegular),
                label: 'Back',
                selectedIcon: SvgPicture.asset(AppMedia.goBackFilled)),
          ],
          selectedIndex: _selectedIconIndex,
          onDestinationSelected: _bottomNavBarButtonTapped,
          indicatorColor: Colors.transparent,
        ),
      ),
      body: appScreens[_selectedIconIndex],
    );
  }
}

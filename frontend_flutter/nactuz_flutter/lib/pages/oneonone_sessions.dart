import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nactuz_flutter/oneonone_session_screens/oneonone_sessions_list.dart';

import '../media.dart';

class OneononeSessions extends ConsumerStatefulWidget {
  const OneononeSessions({super.key});

  @override
  ConsumerState<OneononeSessions> createState() => _OneononeSessionsState();
}

class _OneononeSessionsState extends ConsumerState<OneononeSessions> {
  final appScreens = [
    const OneononeSessionsList(),
    const Center(child: Text('Page 2 : Analysis')),
    const Center(child: Text('Page 3 : Doubts')),
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 0))
        ]),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AppMedia.oneOnOneRegular),
                label: 'Book',
                selectedIcon: SvgPicture.asset(AppMedia.oneOnOneFilled)),
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

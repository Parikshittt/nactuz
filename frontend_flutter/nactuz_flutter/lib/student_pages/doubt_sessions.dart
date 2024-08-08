import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


import '../media.dart';
import '../student_doubt_session_screens/doubt_session_list.dart';

class DoubtSessions extends ConsumerStatefulWidget {
  const DoubtSessions({super.key});

  @override
  ConsumerState<DoubtSessions> createState() => _DoubtSessionsState();
}

class _DoubtSessionsState extends ConsumerState<DoubtSessions> {
  final appScreens = [
    const DoubtSessionList(),
    const Center(child: Text('Page 2 : Analysis')),
    const Center(child: Text('Page 3 : Doubts')),
  ];

  int _selectedIconIndex = 0;

  void _bottomNavBarButtonTapped(int index) {
    if (index == 3) {
      setState(() {
        _selectedIconIndex = 0;
        context.go('/studentHomePage');
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
                icon: SvgPicture.asset(AppMedia.doubtsRegular),
                label: 'Book',
                selectedIcon: SvgPicture.asset(AppMedia.doubtsFilled)),
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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:nactuz_flutter/teacher_side_app/teacher_home_page_screens/teacher_home_screen.dart';
import 'package:nactuz_flutter/teacher_side_app/teacher_home_page_screens/teacher_wallet_screen.dart';
import '../../media.dart';

class TeacherHomePage extends ConsumerStatefulWidget {
  const TeacherHomePage({super.key});

  @override
  ConsumerState<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends ConsumerState<TeacherHomePage> {
  int _selectedIndex = 4;

  final List<Widget> _pages = const [
    TeacherHomeScreen(),
    Center(child: Text('Upcoming Screen')), // Placeholder
    Center(child: Text('History Screen')),
    Center(child: Text('History Screen')),
    TeacherWalletScreen(),
  ];

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              // Adjust the blur intensity as needed
              child: Container(
                color: Colors
                    .transparent, // Make sure the filter is applied over the transparent container
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppStyles.mainBackgroundColor,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    _bottomSheetButton('CREATE MOCK TEST'),
                    const SizedBox(height: 15),
                    _bottomSheetButton('CREATE DOUBT SESSION'),
                    const SizedBox(height: 15),
                    _bottomSheetButton('CREATE 1:1 SESSION'),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bottomSheetButton(String text) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyles.cardBackgroundColor,
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 20)],
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.sixteenBoldMain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)]),
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          backgroundColor: AppStyles.mainBackgroundColor,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onBottomNavBarItemTapped,
          destinations: _buildNavigationDestinations(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyles.cardBackgroundColor,
        onPressed: _showBottomSheet,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: AppStyles.brandColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        icon: SvgPicture.asset(AppMedia.upcomingRegular),
        label: 'Upcoming',
        selectedIcon: SvgPicture.asset(AppMedia.upcomingFilled),
      ),
      NavigationDestination(
        icon: Container(),
        label: '',
        enabled: false,
      ),
      NavigationDestination(
        icon: SvgPicture.asset(AppMedia.historyRegular),
        label: 'History',
        selectedIcon: SvgPicture.asset(AppMedia.historyFilled),
      ),
      NavigationDestination(
        icon: SvgPicture.asset(AppMedia.walletRegular),
        label: 'Wallet',
        selectedIcon: SvgPicture.asset(AppMedia.walletFilled),
      ),
    ];
  }
}

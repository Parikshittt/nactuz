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
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    TeacherHomeScreen(),
    Center(child: Text('Upcoming Screen')), // Placeholder
    Center(child: Text('History Screen')), // Placeholder
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _bottomSheetButton('CREATE MOCK TEST'),
              _bottomSheetButton('CREATE DOUBT SESSION'),
              _bottomSheetButton('CREATE 1:1 SESSION'),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomSheetButton(String text) {
    return InkWell(
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
      bottomNavigationBar: BottomAppBar(
        color: AppStyles.mainBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                AppMedia.homeRegular,
                color: _selectedIndex == 0 ? AppStyles.brandColor : null,
              ),
              onPressed: () => _onBottomNavBarItemTapped(0),
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppMedia.upcomingRegular,
                color: _selectedIndex == 1 ? AppStyles.brandColor : null,
              ),
              onPressed: () => _onBottomNavBarItemTapped(1),
            ),
            const SizedBox(width: 40), // Empty space for the FAB
            IconButton(
              icon: SvgPicture.asset(
                AppMedia.historyRegular,
                color: _selectedIndex == 2 ? AppStyles.brandColor : null,
              ),
              onPressed: () => _onBottomNavBarItemTapped(2),
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppMedia.walletRegular,
                color: _selectedIndex == 3 ? AppStyles.brandColor : null,
              ),
              onPressed: () => _onBottomNavBarItemTapped(3),
            ),
          ],
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
}

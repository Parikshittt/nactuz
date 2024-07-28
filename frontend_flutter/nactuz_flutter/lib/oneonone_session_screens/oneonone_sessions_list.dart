import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../base/combined_card.dart';
import '../base/header_user_info.dart';
import '../base/search_bar.dart';
import '../fake_data.dart';
import '../media.dart';
import '../provider.dart';
import '../styles/app_styles.dart';

class OneononeSessionsList extends ConsumerStatefulWidget {
  const OneononeSessionsList({super.key});

  @override
  ConsumerState<OneononeSessionsList> createState() =>
      _OneononeSessionsListState();
}

class _OneononeSessionsListState extends ConsumerState<OneononeSessionsList> {
  List<Map<String, dynamic>> getDataByType() {
    return fakeData
        .where((data) => data['typeOfService'] == '1:1 Session')
        .toList();
  }

  String _searchValue = '';

  void _handleSearchChange(String value) {
    setState(() {
      _searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    int counterFromRiverPod = ref.watch(counterProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const HeaderUserInfo(),
              const SizedBox(height: 15),
              SearchBarComponent(onChanged: _handleSearchChange),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    CombinedCard(cardData: getDataByType()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 20, spreadRadius: 5)
          ],
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            FloatingActionButton(
              onPressed: goToCartButtonWasPressed,
              backgroundColor: AppStyles.mainBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(AppMedia.openCart),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppStyles.brandColor,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '$counterFromRiverPod',
                  style: AppStyles.badgeText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToCartButtonWasPressed() {
    // Implement the action when the button is pressed
  }
}

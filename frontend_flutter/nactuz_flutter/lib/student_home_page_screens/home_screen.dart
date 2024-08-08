import 'package:flutter/material.dart';
import 'package:nactuz_flutter/base/analytics_highlights.dart';
import 'package:nactuz_flutter/base/header_user_info.dart';
import 'package:nactuz_flutter/base/home_page_cards.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const HeaderUserInfo(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    AnalyticsHighlights(),
                    SizedBox(
                      height: 15,
                    ),
                    HomePageCards(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

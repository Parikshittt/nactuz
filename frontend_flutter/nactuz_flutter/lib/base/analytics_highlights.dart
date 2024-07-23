import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class AnalyticsHighlights extends StatelessWidget {
  const AnalyticsHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      height: 150,
      child: const Center(
          child: Text(
        'Analytics Coming Soon',
        style: AppStyles.sixteenBoldMain,
      )),
    );
  }
}

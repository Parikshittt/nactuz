import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';

class TeacherTotalSessionStats extends ConsumerStatefulWidget {
  const TeacherTotalSessionStats({super.key});

  @override
  ConsumerState<TeacherTotalSessionStats> createState() =>
      _TeacherTotalSessionStatsState();
}

class _TeacherTotalSessionStatsState
    extends ConsumerState<TeacherTotalSessionStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyles.cardBackgroundColor,
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 20)]),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Sessions Conducted',
                style: AppStyles.sixteenBoldMain,
              ),
              Text(
                '34',
                style: AppStyles.sixteenBoldMain,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mock Tests',
                style: AppStyles.sixteenBoldSecond,
              ),
              Text(
                '10',
                style: AppStyles.sixteenBoldSecond,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Doubt Sessions',
                style: AppStyles.sixteenBoldSecond,
              ),
              Text(
                '16',
                style: AppStyles.sixteenBoldSecond,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1:1 Sessions',
                style: AppStyles.sixteenBoldSecond,
              ),
              Text(
                '8',
                style: AppStyles.sixteenBoldSecond,
              )
            ],
          ),
        ],
      ),
    );
  }
}

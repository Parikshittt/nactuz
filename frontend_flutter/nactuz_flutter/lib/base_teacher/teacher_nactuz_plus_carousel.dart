import 'package:flutter/material.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';

class TeacherNactuzPlusCarousel extends StatefulWidget {
  const TeacherNactuzPlusCarousel({super.key});

  @override
  State<TeacherNactuzPlusCarousel> createState() =>
      _TeacherNactuzPlusCarouselState();
}

class _TeacherNactuzPlusCarouselState extends State<TeacherNactuzPlusCarousel> {
  final List<Map<String, String>> plans = [
    {
      'title': 'Basic Plan',
      'price': 'FREE FOREVER',
      'label': 'FREE',
      'description':
          ' • Manage up to 10 students\n • Take fees and release e-receipt\n • Track up to 50 tests per month',
    },
    {
      'title': 'Premium Plan',
      'price': '\₹2000/year',
      'label': '10% OFF',
      'description':
          ' • Manage up to 100 students\n • Advanced fee management\n • Track 100 tests per month',
    },
    {
      'title': 'Dronacharya Plan',
      'price': 'Talk to us',
      'label': 'CALL',
      'description':
          ' • Manage unlimited students\n • Complete fee management\n • Comprehensive performance tracking',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        itemCount: plans.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Container(
            padding: const EdgeInsets.all(15),
            width: 300,
            decoration: BoxDecoration(
              color: AppStyles.cardBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff344446),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan['title']!,
                          style: AppStyles.sixteenBoldMain,
                        ),
                        Text(
                          plan['price']!,
                          style: AppStyles.twelveRegularSecond,
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                          color: AppStyles.brandColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        plan['label']!,
                        style: AppStyles.twelveBoldBlack,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        plan['description']!,
                        style: AppStyles.twelveRegularSecond,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

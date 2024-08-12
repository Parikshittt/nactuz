import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nactuz_flutter/media.dart';

import '../../base_teacher/teacher_header.dart';
import '../../styles/app_styles.dart';

class TeacherWalletScreen extends ConsumerStatefulWidget {
  const TeacherWalletScreen({super.key});

  @override
  ConsumerState<TeacherWalletScreen> createState() =>
      _TeacherWalletScreenState();
}

class _TeacherWalletScreenState extends ConsumerState<TeacherWalletScreen> {
  bool isWalletValueVisible = true;

  // State for the selected UPI
  int selectedUPIId = 1;

  final fakeUPIStorage = [
    {
      'id': 1,
      'upiId': '123@okaxis',
      'ownerName': 'Warren Buffet',
      'createdOn': '2024-07-30T00:00:00Z'
    },
    {
      'id': 2,
      'upiId': '69420@okaxis',
      'ownerName': 'Elon Musk',
      'createdOn': '2024-07-30T00:00:00Z'
    },
    {
      'id': 3,
      'upiId': '782373737@okaxis',
      'ownerName': 'Bill Gates',
      'createdOn': '2024-08-09T00:00:00Z'
    }
  ];

  bool _isCreatedWithinLast7Days(String createdOn) {
    final creationDate = DateTime.parse(createdOn);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(creationDate).inDays;
    return difference <= 7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppStyles.cardBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: TeacherHeader(),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: AppStyles.twentyBoldMain,
                          ),
                          Text(
                            'as on 29 December 2024 11:16 pm',
                            style: AppStyles.tenRegularSecond,
                          )
                        ],
                      ),
                      InkWell(
                        child: SvgPicture.asset(AppMedia.refreshButton),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isWalletValueVisible
                          ? Text(
                              '₹10,479.91',
                              style: AppStyles.thirtySixBoldMain,
                            )
                          : Text(
                              '₹***',
                              style: AppStyles.thirtySixBoldMain,
                            ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isWalletValueVisible = !isWalletValueVisible;
                            });
                          },
                          child: SvgPicture.asset(AppMedia.openEye))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Redeem your wallet balance directly through UPI ⚡',
                    style: AppStyles.twelveRegularSecond,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: fakeUPIStorage.map((upi) {
                      final createdOn = upi['createdOn'] as String;
                      final showDisclaimer =
                          _isCreatedWithinLast7Days(createdOn);

                      final isSelected = selectedUPIId == upi['id'];

                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (_isCreatedWithinLast7Days(createdOn)) {
                              print('Not Activated Yet');
                              return;
                            }
                            selectedUPIId = upi['id'] as int;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppStyles.brandColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppStyles.brandColor
                                        : Colors.transparent,
                                    border:
                                        Border.all(color: AppStyles.brandColor),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      upi['upiId'] as String,
                                      style: isSelected
                                          ? AppStyles.sixteenBoldMain
                                          : AppStyles.sixteenRegularSecond,
                                    ),
                                    if (showDisclaimer)
                                      const Text(
                                        'Not activated yet - wait 2 more days',
                                        style: AppStyles.twelveRegularSecond,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppStyles.secondTextColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5),
                          prefixStyle: AppStyles.sixteenBoldMain,
                          border: InputBorder.none,
                          hintText: 'min withdrawal amount  : ₹500',
                          hintFadeDuration: Duration(milliseconds: 300),
                          prefixText: '₹ ',
                          hintStyle: AppStyles.sixteenBoldSecond),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppStyles.brandColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Redeem',
                        style: AppStyles.filledButtonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import '../styles/app_styles.dart';

class TeacherEarningsInfo extends ConsumerStatefulWidget {
  const TeacherEarningsInfo({super.key});

  @override
  ConsumerState<TeacherEarningsInfo> createState() =>
      _TeacherEarningsInfoState();
}

class _TeacherEarningsInfoState extends ConsumerState<TeacherEarningsInfo> {
  void randomizeTotalCashOut() {
    final random = Random();
    setState(() {
      totalCashOut = random.nextDouble() * 1000000;
    });
  }

  void randomizeWalletBalance() {
    final random = Random();
    setState(() {
      walletBalance = random.nextDouble() * 100000;
    });
  }

  String cashOutSuffix = '';
  String walletSuffix = '';
  double totalCashOut = 2000;
  double walletBalance = 2000;

  double formatValue(double value, {required bool isCashOut}) {
    if (value >= 10000000) {
      return value / 10000000;
    } else if (value >= 100000) {
      return value / 100000;
    } else if (value >= 1000) {
      return value / 1000;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTotalCashOut = formatValue(totalCashOut, isCashOut: true);
    final formattedWalletBalance = formatValue(walletBalance, isCashOut: false);

    if (totalCashOut >= 10000000) {
      cashOutSuffix = 'Cr';
    } else if (totalCashOut >= 100000) {
      cashOutSuffix = 'L';
    } else if (totalCashOut >= 1000) {
      cashOutSuffix = 'K';
    } else {
      cashOutSuffix = '';
    }

    if (walletBalance >= 10000000) {
      walletSuffix = 'Cr';
    } else if (walletBalance >= 100000) {
      walletSuffix = 'L';
    } else if (walletBalance >= 1000) {
      walletSuffix = 'K';
    } else {
      walletSuffix = '';
    }

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onLongPress: randomizeTotalCashOut,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppStyles.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 20),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Cash Out',
                      style: AppStyles.sixteenBoldMain,
                    ),
                    AnimatedFlipCounter(
                      decimalSeparator: '.',
                      suffix: cashOutSuffix,
                      prefix: '₹',
                      wholeDigits: 1,
                      hideLeadingZeroes: true,
                      fractionDigits: 1,
                      value: formattedTotalCashOut,
                      textStyle: AppStyles.thirtySixBoldMain,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    const Text(
                      'Hold To Refresh',
                      style: AppStyles.twelveRegularSecond,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onLongPress: randomizeWalletBalance,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppStyles.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 20),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallet Balance',
                      style: AppStyles.sixteenBoldMain,
                    ),
                    AnimatedFlipCounter(
                      prefix: '₹',
                      fractionDigits: 1,
                      value: formattedWalletBalance,
                      suffix: walletSuffix,
                      textStyle: AppStyles.thirtySixBoldMain,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    const Text(
                      'Hold To Refresh',
                      style: AppStyles.twelveRegularSecond,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

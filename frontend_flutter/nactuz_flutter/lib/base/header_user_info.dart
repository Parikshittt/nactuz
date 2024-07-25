import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nactuz_flutter/media.dart';
import '../styles/app_styles.dart';
import 'package:nactuz_flutter/provider.dart'; // Ensure the correct path

class HeaderUserInfo extends StatefulWidget {
  const HeaderUserInfo({super.key});

  @override
  State<HeaderUserInfo> createState() => _HeaderUserInfoState();
}

class _HeaderUserInfoState extends State<HeaderUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userName = ref.watch(studentName);
        final fullAddress = ref.watch(studentFullAddress);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppMedia.studentIcon),
                const SizedBox(width: 5),
                Text(
                  userName,
                  style: AppStyles.sixteenBoldMain,
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  fullAddress,
                  style: AppStyles.twelveRegularSecond,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nactuz_flutter/media.dart';

import '../styles/app_styles.dart';

class HeaderUserInfo extends StatefulWidget {
  const HeaderUserInfo({super.key});

  @override
  State<HeaderUserInfo> createState() => _HeaderUserInfoState();
}

class _HeaderUserInfoState extends State<HeaderUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppMedia.studentIcon),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Parikshit Singh',
              style: AppStyles.sixteenBoldMain,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            Text(
              'Panchkula, Haryana',
              style: AppStyles.twelveRegularSecond,
            )
          ],
        )
      ],
    );
  }
}


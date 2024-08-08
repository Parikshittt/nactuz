import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../media.dart';
import '../styles/app_styles.dart';

class TeacherHeader extends ConsumerStatefulWidget {
  const TeacherHeader({super.key});

  @override
  ConsumerState<TeacherHeader> createState() => _TeacherHeaderState();
}

class _TeacherHeaderState extends ConsumerState<TeacherHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppStyles.cardBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parikshit',
                style: AppStyles.sixteenBoldMain,
              ),
              Text(
                'Panchkula, Haryana',
                style: AppStyles.twelveRegularSecond,
              ),
            ],
          ),
          InkWell(
            onTap: () => {},
            child: SvgPicture.asset(AppMedia.teacherProfileIcon),
          ),
        ],
      ),
    );
  }
}

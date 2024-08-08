import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nactuz_flutter/base_teacher/teacher_earnings_info.dart';
import 'package:nactuz_flutter/base_teacher/teacher_header.dart';
import 'package:nactuz_flutter/base_teacher/teacher_nactuz_plus_carousel.dart';
import 'package:nactuz_flutter/base_teacher/teacher_rank.dart';
import 'package:nactuz_flutter/base_teacher/teacher_total_session_stats.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';

class TeacherHomeScreen extends ConsumerStatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  ConsumerState<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends ConsumerState<TeacherHomeScreen> {
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
              child: const Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TeacherRank(),
                  SizedBox(
                    height: 15,
                  ),
                  TeacherTotalSessionStats(),
                  SizedBox(
                    height: 15,
                  ),
                  TeacherEarningsInfo(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                TeacherNactuzPlusCarousel(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

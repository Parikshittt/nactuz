import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base_teacher/teacher_header.dart';
import '../../styles/app_styles.dart';

class TeacherWalletScreen extends ConsumerStatefulWidget {
  const TeacherWalletScreen({super.key});

  @override
  ConsumerState<TeacherWalletScreen> createState() => _TeacherWalletScreenState();
}

class _TeacherWalletScreenState extends ConsumerState<TeacherWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppStyles.cardBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: TeacherHeader(),
            ),
            pinned: true,
          ),

        ],
      ),
    );
  }
}

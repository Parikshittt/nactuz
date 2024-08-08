import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../styles/app_styles.dart';

class TeacherRank extends ConsumerStatefulWidget {
  const TeacherRank({super.key});

  @override
  ConsumerState<TeacherRank> createState() => _TeacherRankState();
}

class _TeacherRankState extends ConsumerState<TeacherRank> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(60)),
            color: AppStyles.cardBackgroundColor,
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 20),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'Your\nRank',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'InterFigmaFont',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = AppStyles.brandColor,
                      ),
                    ),
                    // Solid text as fill.
                    const Text(
                      'Your\nRank',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'InterFigmaFont',
                        color: Color(0xff344446),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      '#99',
                      style: TextStyle(
                        fontSize: 72,
                        fontFamily: 'InterFigmaFont',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = AppStyles.brandColor,
                      ),
                    ),
                    // Solid text as fill.
                    const Text(
                      '#99',
                      style: TextStyle(
                        fontFamily: 'InterFigmaFont',
                        fontSize: 72,
                        color: Color(0xff344446),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

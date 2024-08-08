import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../student_pages/doubt_sessions.dart';
import '../student_pages/mock_tests.dart';
import '../student_pages/oneonone_sessions.dart';
import '../styles/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePageCards extends StatefulWidget {
  const HomePageCards({super.key});

  @override
  State<HomePageCards> createState() => _HomePageCardsState();
}

class _HomePageCardsState extends State<HomePageCards> {
  String? _activeCardType; // Track the clicked card type

  void _handleTap(String cardType) {
    setState(() {
      _activeCardType = cardType;
    });

    Widget targetPage;
    switch (cardType) {
      case 'MOCK TESTS':
        targetPage = const MockTests();
        break;
      case 'DOUBT SESSIONS':
        targetPage = const DoubtSessions();
        break;
      case '1:1 SESSION':
        targetPage = const OneononeSessions();
        break;
      default:
        targetPage = Scaffold(
          body: const Center(child: Text('Coming Soon')).animate().blurXY(
              duration: const Duration(milliseconds: 800),
              begin: 20,
              end: 0,
              curve: Curves.fastEaseInToSlowEaseOut),
        );
        break;
    }

    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => targetPage,
      ),
    )
        .then((_) => setState(() {
      _activeCardType = null; // Reset after navigation
    }));
  }

  Widget _buildCard(String title, String tagline, String cardType) {
    bool isActive = _activeCardType == cardType; // Check if this card is active

    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: IgnorePointer(
          ignoring: isActive,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _handleTap(cardType),
            child: Container(
              decoration: BoxDecoration(
                color: AppStyles.cardBackgroundColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                  )
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: isActive
                  ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppStyles.brandColor,
                  size: 30,
                ),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.cardHeaderStyles,
                  ),
                  Text(
                    tagline,
                    style: AppStyles.cardTagLineStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: <Widget>[
                _buildCard(
                    'MOCK TESTS',
                    'Test your preparation\nSee where you stand\nMake improvements',
                    'MOCK TESTS'),
                const SizedBox(width: 15),
                _buildCard(
                    'DOUBT SESSIONS',
                    'Clear your doubts\nGet expert guidance\nBoost your understanding',
                    'DOUBT SESSIONS'),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                _buildCard(
                    'ANALYSIS',
                    'Identify Strength\nEliminate Weaknesses\nGet Personalized Insights',
                    'ANALYSIS'),
                const SizedBox(width: 15),
                _buildCard(
                    '1:1 SESSION',
                    'Personalized coaching\nFocused learning\nAchieve your goals',
                    '1:1 SESSION'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

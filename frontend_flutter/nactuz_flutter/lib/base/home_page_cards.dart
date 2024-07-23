import 'package:flutter/material.dart';
import 'package:nactuz_flutter/pages/mock_tests.dart';
import '../styles/app_styles.dart';

class HomePageCards extends StatefulWidget {
  const HomePageCards({super.key});

  @override
  State<HomePageCards> createState() => _HomePageCardsState();
}

class _HomePageCardsState extends State<HomePageCards> {
  int _selectedCardIndex = -1;

  void _handleTap(String cardType) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MockTests(),
      ),
    );
    setState(() {
      switch (cardType.toLowerCase()) {
        case 'mock tests':
          _selectedCardIndex = 1;
          break;
        case 'analysis':
          _selectedCardIndex = 2;
          break;
        case 'doubt sessions':
          _selectedCardIndex = 3;
          break;
        case '1:1 session':
          _selectedCardIndex = 4;
          break;
        default:
          _selectedCardIndex = -1;
      }
      print('$_selectedCardIndex : This card was tapped');
    });
  }

  Widget _buildCard(String title, String tagline, String cardType) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
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
            child: Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

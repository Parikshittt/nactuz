import 'package:flutter/material.dart';
import 'package:nactuz_flutter/base/mock_test_list_card.dart';

import '../base/header_user_info.dart';
import '../base/search_bar.dart';

class MockTestsList extends StatefulWidget {
  const MockTestsList({super.key});

  @override
  State<MockTestsList> createState() => _MockTestsListState();
}

class _MockTestsListState extends State<MockTestsList> {
  @override
  Widget build(BuildContext context) {
    const testListDetails = [
      {
        'id': 1,
        'testTitle': 'Mathematics',
        'seatsAvailable': 999,
        'fullAddress': 'Sector 35, Chandigarh',
        'totalMarks': 360,
        'dateAndTimeOfTest': '29 December • 7 pm',
        'testDuration': '3 hours',
        'priceOfTest': 150
      },
      {
        'id': 2,
        'testTitle': 'Physics',
        'seatsAvailable': 50,
        'fullAddress': 'Sector 22, Chandigarh',
        'totalMarks': 320,
        'dateAndTimeOfTest': '30 December • 10 am',
        'testDuration': '2 hours',
        'priceOfTest': 200
      },
      {
        'id': 3,
        'testTitle': 'Chemistry',
        'seatsAvailable': 70,
        'fullAddress': 'Sector 45, Chandigarh',
        'totalMarks': 300,
        'dateAndTimeOfTest': '31 December • 1 pm',
        'testDuration': '3 hours',
        'priceOfTest': 180
      },
      {
        'id': 4,
        'testTitle': 'Biology',
        'seatsAvailable': 85,
        'fullAddress': 'Sector 12, Chandigarh',
        'totalMarks': 340,
        'dateAndTimeOfTest': '1 January • 9 am',
        'testDuration': '4 hours',
        'priceOfTest': 170
      },
      {
        'id': 5,
        'testTitle': 'English',
        'seatsAvailable': 120,
        'fullAddress': 'Sector 18, Chandigarh',
        'totalMarks': 280,
        'dateAndTimeOfTest': '2 January • 11 am',
        'testDuration': '2 hours',
        'priceOfTest': 140
      },
      {
        'id': 6,
        'testTitle': 'History',
        'seatsAvailable': 95,
        'fullAddress': 'Sector 40, Chandigarh',
        'totalMarks': 310,
        'dateAndTimeOfTest': '3 January • 8 am',
        'testDuration': '3 hours',
        'priceOfTest': 160
      },
      {
        'id': 7,
        'testTitle': 'Geography',
        'seatsAvailable': 130,
        'fullAddress': 'Sector 15, Chandigarh',
        'totalMarks': 290,
        'dateAndTimeOfTest': '4 January • 2 pm',
        'testDuration': '3 hours',
        'priceOfTest': 150
      },
      {
        'id': 8,
        'testTitle': 'Political Science',
        'seatsAvailable': 75,
        'fullAddress': 'Sector 26, Chandigarh',
        'totalMarks': 330,
        'dateAndTimeOfTest': '5 January • 5 pm',
        'testDuration': '2 hours',
        'priceOfTest': 180
      },
      {
        'id': 9,
        'testTitle': 'Economics',
        'seatsAvailable': 110,
        'fullAddress': 'Sector 31, Chandigarh',
        'totalMarks': 320,
        'dateAndTimeOfTest': '6 January • 4 pm',
        'testDuration': '3 hours',
        'priceOfTest': 170
      },
      {
        'id': 10,
        'testTitle': 'Sociology',
        'seatsAvailable': 60,
        'fullAddress': 'Sector 10, Chandigarh',
        'totalMarks': 300,
        'dateAndTimeOfTest': '7 January • 6 pm',
        'testDuration': '2 hours',
        'priceOfTest': 160
      },
      {
        'id': 11,
        'testTitle': 'Psychology',
        'seatsAvailable': 80,
        'fullAddress': 'Sector 20, Chandigarh',
        'totalMarks': 310,
        'dateAndTimeOfTest': '8 January • 7 pm',
        'testDuration': '3 hours',
        'priceOfTest': 150
      },
      {
        'id': 12,
        'testTitle': 'Philosophy',
        'seatsAvailable': 90,
        'fullAddress': 'Sector 30, Chandigarh',
        'totalMarks': 330,
        'dateAndTimeOfTest': '9 January • 8 am',
        'testDuration': '3 hours',
        'priceOfTest': 140
      },
      {
        'id': 13,
        'testTitle': 'Computer Science',
        'seatsAvailable': 100,
        'fullAddress': 'Sector 25, Chandigarh',
        'totalMarks': 340,
        'dateAndTimeOfTest': '10 January • 9 am',
        'testDuration': '3 hours',
        'priceOfTest': 200
      },
      {
        'id': 14,
        'testTitle': 'Information Technology',
        'seatsAvailable': 85,
        'fullAddress': 'Sector 5, Chandigarh',
        'totalMarks': 350,
        'dateAndTimeOfTest': '11 January • 11 am',
        'testDuration': '2 hours',
        'priceOfTest': 190
      },
      {
        'id': 15,
        'testTitle': 'Business Studies',
        'seatsAvailable': 105,
        'fullAddress': 'Sector 28, Chandigarh',
        'totalMarks': 360,
        'dateAndTimeOfTest': '12 January • 3 pm',
        'testDuration': '3 hours',
        'priceOfTest': 210
      }
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const HeaderUserInfo(),
              const SizedBox(
                height: 15,
              ),
              const SearchBarComponent(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView(
                children: const [
                  MockTestListCard(
                    testListData: testListDetails,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

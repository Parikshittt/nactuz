import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nactuz_flutter/media.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';

class MockTestListCard extends StatefulWidget {
  const MockTestListCard({super.key, required this.testListData});

  final List<Map<String, dynamic>> testListData;

  @override
  State<MockTestListCard> createState() => _MockTestListCardState();
}

class _MockTestListCardState extends State<MockTestListCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _tappedCardId = 0;

  void _handleCardTap(int id) {
    setState(() {
      _tappedCardId = (_tappedCardId == id) ? 0 : id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the testListData from the widget instance
    final List<Map<String, dynamic>> testDetailsList = widget.testListData;

    return Column(
      children: testDetailsList.map(_buildCard).toList(),
    );
  }

  Widget _buildCard(Map<String, dynamic> testDetails) {
    return Column(
      children: [
        InkWell(
          onTap: () => _handleCardTap(testDetails['id']),
          child: Container(
            decoration: BoxDecoration(
              color: AppStyles.cardBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 7,
                          child: Text(
                            testDetails['testTitle'] ?? 'No Title',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.sixteenBoldMain,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                                '${testDetails['seatsAvailable']} left',
                                style: AppStyles.twelveBoldMain,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 7,
                          child: Text(
                              testDetails['fullAddress'] ?? 'No Address',
                              style: AppStyles.twelveBoldSecond),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                              '${testDetails['totalMarks'] ?? '0'} marks',
                              style: AppStyles.twelveBoldSecond),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 7,
                          child: Text(
                              '${testDetails['dateAndTimeOfTest'] ?? 'No Date'} • ${testDetails['testDuration'] ?? 'No Duration'}',
                              style: AppStyles.twelveBoldSecond),
                        ),
                        Flexible(
                            flex: 3,
                            child: Text('₹${testDetails['priceOfTest'] ?? '0'}',
                                style: AppStyles.twelveBoldSecond)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _tappedCardId == testDetails['id']
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppStyles.brandColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: AppStyles.outlineButtonText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppStyles.brandColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: AppStyles.outlineButtonText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container(),

                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

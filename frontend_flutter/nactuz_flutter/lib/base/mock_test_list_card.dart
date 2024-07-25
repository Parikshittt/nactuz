import 'package:flutter/material.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider.dart';

class MockTestListCard extends ConsumerStatefulWidget {
  const MockTestListCard({super.key, required this.testListData});

  final List<Map<String, dynamic>> testListData;

  @override
  ConsumerState<MockTestListCard> createState() => _MockTestListCardState();
}

class _MockTestListCardState extends ConsumerState<MockTestListCard> {
  int _tappedCardId = 0;
  bool _isLoaderVisible = false;

  void _handleCardTap(int id) {
    setState(() {
      _tappedCardId = (_tappedCardId == id) ? 0 : id;
    });
  }

  void _handleAddToCart(int id) {
    setState(() {
      _isLoaderVisible = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoaderVisible = false;
      });

      final itemsInCartNotifier = ref.read(itemsInCartProvider.notifier);

      itemsInCartNotifier.update((state) {
        final updatedList = List<int>.from(state);
        if (updatedList.contains(id)) {
          updatedList.remove(id); // Remove item from cart
        } else {
          updatedList.add(id); // Add item to cart
        }
        return updatedList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> testDetailsList = widget.testListData;

    return Column(
      children: testDetailsList.map((testDetails) {
        // Pass `testDetails` directly to `_buildCard`
        return _buildCard(testDetails);
      }).toList(),
    );
  }

  Widget _buildCard(Map<String, dynamic> testDetails) {
    final isSelected = _tappedCardId == testDetails['id'];

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
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
                      // Original _buildCard content here
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                '${testDetails['seatsAvailable']} left',
                                style: AppStyles.twelveBoldMain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 7,
                            child: Text(
                              testDetails['fullAddress'] ?? 'No Address',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              '${testDetails['totalMarks'] ?? '0'} marks',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 7,
                            child: Text(
                              '${testDetails['dateAndTimeOfTest'] ?? 'No Date'} • ${testDetails['testDuration'] ?? 'No Duration'}',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              '₹${testDetails['priceOfTest'] ?? '0'}',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      isSelected
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: IgnorePointer(
                                    ignoring: _isLoaderVisible,
                                    child: InkWell(
                                      onTap: () =>
                                          _handleAddToCart(testDetails['id']),
                                      enableFeedback: true,
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 1, 5, 1),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppStyles.brandColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                          child: _isLoaderVisible
                                              ? LoadingAnimationWidget
                                                  .staggeredDotsWave(
                                                  color: AppStyles.brandColor,
                                                  size: 20,
                                                )
                                              : Text(
                                                  ref
                                                          .read(
                                                              itemsInCartProvider)
                                                          .contains(
                                                              testDetails['id'])
                                                      ? 'ADDED'
                                                      : 'ADD TO CART',
                                                  style: AppStyles
                                                      .outlineButtonText,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    child: Container(
                                      height: 40,
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                      decoration: BoxDecoration(
                                        color: AppStyles.brandColor,
                                        border: Border.all(
                                          color: AppStyles.brandColor,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'BUY NOW',
                                          style: AppStyles.filledButtonText,
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
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

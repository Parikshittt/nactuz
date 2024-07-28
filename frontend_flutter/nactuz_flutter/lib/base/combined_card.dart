import 'package:flutter/material.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider.dart';

class CombinedCard extends ConsumerStatefulWidget {
  const CombinedCard({super.key, required this.cardData});

  final List<Map<String, dynamic>> cardData;

  @override
  ConsumerState<CombinedCard> createState() => _CombinedCardState();
}

class _CombinedCardState extends ConsumerState<CombinedCard> {
  int _tappedCardId = 0;
  bool _isLoaderVisible = false;

  void _handleCardTap(int id) {
    setState(() {
      _tappedCardId = (_tappedCardId == id) ? 0 : id;
    });
  }

  void _handleAddToWishList(int id) {
    setState(() {
      _isLoaderVisible = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoaderVisible = false;
      });

      final itemsInCartNotifier = ref.read(itemsInWishlistProvider.notifier);

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
    final List<Map<String, dynamic>> cardDataReceived = widget.cardData;

    return Column(
      children: cardDataReceived.map((cardData) {
        switch (cardData['typeOfService']) {
          case 'Mock Test':
            return _buildTestCard(cardData);
          case 'Doubt Session':
            return _buildDoubtSessionCard(cardData);
          case '1:1 Session':
            return _buildOneOnOneCard(cardData);
          default:
            return Container(); // Handle unknown typeOfService if needed
        }
      }).toList(),
    );
  }

  Widget _buildTestCard(Map<String, dynamic> testDetails) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 7,
                            child: Text(
                              testDetails['title'] ?? 'No Title',
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
                              '${testDetails['dateAndTime'] ?? 'No Date'} • ${testDetails['duration'] ?? 'No Duration'}',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              '₹${testDetails['price'] ?? '0'}',
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
                                onTap: () => _handleAddToWishList(testDetails['id']),
                                enableFeedback: true,
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
                                  child: Center(
                                    child: _isLoaderVisible
                                        ? LoadingAnimationWidget.staggeredDotsWave(
                                      color: AppStyles.brandColor,
                                      size: 20,
                                    )
                                        : Text(
                                      ref.read(itemsInWishlistProvider).contains(testDetails['id'])
                                          ? 'ADDED'
                                          : 'ADD TO ♡',
                                      style: AppStyles.outlineButtonText,
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
                                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                decoration: BoxDecoration(
                                  color: AppStyles.brandColor,
                                  border: Border.all(
                                    color: AppStyles.brandColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
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

  Widget _buildDoubtSessionCard(Map<String, dynamic> doubtSessionDetails) {
    final isSelected = _tappedCardId == doubtSessionDetails['id'];

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => _handleCardTap(doubtSessionDetails['id']),
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
                              doubtSessionDetails['title'] ?? 'No Title',
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
                                '${doubtSessionDetails['seatsAvailable']} left',
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
                              doubtSessionDetails['fullAddress'] ?? 'No Address',
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
                              '${doubtSessionDetails['dateAndTime'] ?? 'No Date'}',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              '₹${doubtSessionDetails['price'] ?? '0'}',
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
                                onTap: () => _handleAddToWishList(doubtSessionDetails['id']),
                                enableFeedback: true,
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
                                  child: Center(
                                    child: _isLoaderVisible
                                        ? LoadingAnimationWidget.staggeredDotsWave(
                                      color: AppStyles.brandColor,
                                      size: 20,
                                    )
                                        : Text(
                                      ref.read(itemsInWishlistProvider).contains(doubtSessionDetails['id'])
                                          ? 'ADDED'
                                          : 'ADD TO ♡',
                                      style: AppStyles.outlineButtonText,
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
                                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                decoration: BoxDecoration(
                                  color: AppStyles.brandColor,
                                  border: Border.all(
                                    color: AppStyles.brandColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'BOOK NOW',
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

  Widget _buildOneOnOneCard(Map<String, dynamic> oneOnOneDetails) {
    final isSelected = _tappedCardId == oneOnOneDetails['id'];

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => _handleCardTap(oneOnOneDetails['id']),
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
                              oneOnOneDetails['title'] ?? 'No Title',
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
                                '${oneOnOneDetails['seatsAvailable']} left',
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
                              oneOnOneDetails['fullAddress'] ?? 'No Address',
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
                              '${oneOnOneDetails['dateAndTime'] ?? 'No Date'}',
                              style: AppStyles.twelveBoldSecond,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              '₹${oneOnOneDetails['price'] ?? '0'}',
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
                                onTap: () => _handleAddToWishList(oneOnOneDetails['id']),
                                enableFeedback: true,
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
                                  child: Center(
                                    child: _isLoaderVisible
                                        ? LoadingAnimationWidget.staggeredDotsWave(
                                      color: AppStyles.brandColor,
                                      size: 20,
                                    )
                                        : Text(
                                      ref.read(itemsInWishlistProvider).contains(oneOnOneDetails['id'])
                                          ? 'ADDED'
                                          : 'ADD TO ♡',
                                      style: AppStyles.outlineButtonText,
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
                                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                decoration: BoxDecoration(
                                  color: AppStyles.brandColor,
                                  border: Border.all(
                                    color: AppStyles.brandColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'BOOK NOW',
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

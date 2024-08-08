import 'package:flutter/material.dart';

const Color brandColor = Color(0xFF8EE2EF);
const Color mainBackgroundColor = Color(0xFF121212);
const Color cardsBackgroundColor = Color(0xFF1E1E1E);
const Color mainTextColor = Color(0xFFFFFFFF);
const Color secondTextColor = Color(0xFFB3B3B3);

class AppStyles {
  static const Color brandColor = Color(0xFF8EE2EF);
  static const Color mainBackgroundColor = Color(0xFF121212);
  static const Color cardBackgroundColor = Color(0xFF1E1E1E);
  static const Color mainTextColor = Color(0xFFFFFFFF);
  static const Color secondTextColor = Color(0xFFB3B3B3);

  // 12px font size
  static const TextStyle twelveRegularMain = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: mainTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle twelveRegularSecond = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: secondTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle twelveBoldMain = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: mainTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle twelveBoldBlack = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'InterFigmaFont');
  static const TextStyle twelveBoldSecond = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: secondTextColor,
      fontFamily: 'InterFigmaFont');

  // 16px font size
  static const TextStyle sixteenRegularMain = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: mainTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle sixteenRegularSecond = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: secondTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle sixteenBoldSecond = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: secondTextColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle sixteenBoldMain = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: mainTextColor,
      fontFamily: 'InterFigmaFont');

  static const TextStyle cardTagLineStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: secondTextColor,
      letterSpacing: -1,
      fontFamily: 'InterFigmaFont');
  static const TextStyle cardHeaderStyles = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: mainTextColor,
      letterSpacing: -1.2,
      fontFamily: 'InterFigmaFont');
  static const TextStyle outlineButtonText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: brandColor,
      fontFamily: 'InterFigmaFont');
  static const TextStyle filledButtonText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: cardBackgroundColor,
      fontFamily: 'InterFigmaFont');

  static const TextStyle badgeText = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: mainBackgroundColor,
      fontFamily: 'InterFigmaFont');

  static const TextStyle twelveRegularBrand = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: brandColor,
      fontFamily: 'InterFigmaFont');

  static  TextStyle twentyEightBoldBrand = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: brandColor,
      fontFamily: 'InterFigmaFont');

  static  TextStyle sixtyBoldBrand = const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.w700,
      color: brandColor,
      fontFamily: 'InterFigmaFont');

  static  TextStyle thirtySixBoldMain = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: 'InterFigmaFont');
}

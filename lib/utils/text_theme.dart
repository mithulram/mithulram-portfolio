
import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

TextTheme mobileTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 20, // Large heading size
    fontWeight: FontWeight.w600, // Bold weight for emphasis
    color: AppColors.white, // White color for large heading
    fontFamily: 'Poppins',
  ),
  headlineMedium: TextStyle(
    fontSize: 16, // Medium heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  headlineSmall: TextStyle(
    fontSize: 24, // Small heading size
    fontWeight: FontWeight.normal,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  titleLarge: TextStyle(
    fontSize: 14, // Small heading size
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  titleMedium: TextStyle(
    fontSize: 12, // Small heading size
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  labelLarge: TextStyle(
    fontSize: 10, // Small heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  labelMedium: TextStyle(
    fontSize: 10, // Small heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  bodyLarge: TextStyle(
    fontSize: 11, // Standard body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
  bodyMedium: TextStyle(
    fontSize: 10, // Medium body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
  bodySmall: TextStyle(
    fontSize: 10, // Small body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
);


TextTheme deskTopTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 30, // Large heading size
    fontWeight: FontWeight.w600, // Bold weight for emphasis
    color: AppColors.white, // White color for large heading
    fontFamily: 'Poppins',
  ),
  headlineMedium: TextStyle(
    fontSize: 26, // Medium heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  headlineSmall: TextStyle(
    fontSize: 24, // Small heading size
    fontWeight: FontWeight.normal,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  titleLarge: TextStyle(
    fontSize: 18, // Small heading size
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  labelLarge: TextStyle(
    fontSize: 16, // Small heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  labelMedium: TextStyle(
    fontSize: 14, // Small heading size
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'Poppins',
  ),
  bodyLarge: TextStyle(
    fontSize: 16, // Standard body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
  bodyMedium: TextStyle(
    fontSize: 14, // Medium body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
  bodySmall: TextStyle(
    fontSize: 12, // Small body text size
    color: AppColors.lightGray, // Light gray color for body text
    fontFamily: 'Poppins',
  ),
);
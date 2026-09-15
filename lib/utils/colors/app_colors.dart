import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

class AppColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryLight = Color(0xFFA29BFE);
  static const Color background = Color(0xFFF7F7FC);
  static const Color cardBackground = Colors.white;
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color success = Color(0xFF00B894);
  static const Color danger = Color(0xFFD63031);
  static const Color like = Color(0xFF00B894);
  static const Color dislike = Color(0xFFD63031);
  static const Color views = Color(0xFF0984E3);

  static const List<Color> tagColors = [
    Color(0xFF6C5CE7),
    Color(0xFF00B894),
    Color(0xFF0984E3),
    Color(0xFFE17055),
    Color(0xFFE84393),
    Color(0xFFFDCB6E),
  ];

  static const List<Color> avatarColors = [
    Color(0xFF6C5CE7),
    Color(0xFF00B894),
    Color(0xFFE17055),
    Color(0xFF0984E3),
    Color(0xFFE84393),
  ];
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  static const TextStyle body = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    height: 1.4,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );
}

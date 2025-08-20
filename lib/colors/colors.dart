import 'package:flutter/material.dart';

class AppColors {
  // Base
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF2E2E2E);

  // Primary (Figma Purple: #6A0DAD as example)
  static const Color primary = Color(0xFF8130EF);
  static const Color primaryLight = Color(0xFFF8F3FE);
  static const Color primaryDark = Color(0xFF440D7E);

  // Secondary
  static const Color secondary = Color(0xFF29AAE2);
  static const Color secondaryLight = Color(0xFFE2F2FC);
  static const Color secondaryDark = Color(0xFF0E6796);

  // Neutral
  static const Color grey025 = Color(0xFFFCFCFC);
  static const Color grey100 = Color(0xFFF2F2F2);
  static const Color grey200 = Color(0xFFE0E0E0);
  static const Color grey300 = Color(0xFFCECECE);
  static const Color grey400 = Color(0xFFBCBCBC);
  static const Color grey600 = Color(0xFF999999);
  static const Color grey700 = Color(0xFF878787);
  static const Color grey800 = Color(0xFF757575);
  static const Color grey1000 = Color(0xFF515151);
  static const Color grey1200 = Color(0xFF2E2E2E);

  // Semantic colors
  static const Color success = Color(0xFF12B76A);
  static const Color successLight = Color(0xFFECFDF3);
  static const Color redPiano = Colors.red;
  static const Color blueWater = Color(0xFF42A5F5);
  static const Color error = Color(0xFFD92D20);
  static const Color errorLight = Color(0xFFFEF3F2);
  static const Color warning = Color(0xFFF79009);
  static const Color warningLight = Color(0xFFFFFAEB);
  static const Color info = Color(0xFF1570EF);
  static const Color infoLight = Color(0xFFEFF8FF);
}

final MaterialColor primarySwatch =
    MaterialColor(AppColors.primary.toARGB32(), <int, Color>{
      50: AppColors.primary.withValues(alpha: 0.1),
      100: AppColors.primary.withValues(alpha: 0.2),
      200: AppColors.primary.withValues(alpha: 0.4),
      300: AppColors.primary.withValues(alpha: 0.6),
      400: AppColors.primary.withValues(alpha: 0.8),
      500: AppColors.primary.withValues(alpha: 1),
      600: AppColors.primary.withValues(alpha: 1),
      700: AppColors.primary.withValues(alpha: 1),
      800: AppColors.primary.withValues(alpha: 1),
      900: AppColors.primary.withValues(alpha: 1),
    });

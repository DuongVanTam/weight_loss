import 'package:flutter/widgets.dart';
import '../../core/constants/app_constants.dart';

/// Consistent spacing system for the app
class AppSpacing {
  // Spacing Values
  static const double xs = AppConstants.spacingXs;   // 4.0
  static const double s = AppConstants.spacingS;    // 8.0
  static const double m = AppConstants.spacingM;    // 16.0
  static const double l = AppConstants.spacingL;    // 24.0
  static const double xl = AppConstants.spacingXl;  // 32.0
  static const double xxl = AppConstants.spacingXxl; // 48.0

  // Horizontal Spacing Widgets
  static const Widget horizontalXs = SizedBox(width: xs);
  static const Widget horizontalS = SizedBox(width: s);
  static const Widget horizontalM = SizedBox(width: m);
  static const Widget horizontalL = SizedBox(width: l);
  static const Widget horizontalXl = SizedBox(width: xl);
  static const Widget horizontalXxl = SizedBox(width: xxl);

  // Vertical Spacing Widgets
  static const Widget verticalXs = SizedBox(height: xs);
  static const Widget verticalS = SizedBox(height: s);
  static const Widget verticalM = SizedBox(height: m);
  static const Widget verticalL = SizedBox(height: l);
  static const Widget verticalXl = SizedBox(height: xl);
  static const Widget verticalXxl = SizedBox(height: xxl);

  // Padding EdgeInsets
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingS = EdgeInsets.all(s);
  static const EdgeInsets paddingM = EdgeInsets.all(m);
  static const EdgeInsets paddingL = EdgeInsets.all(l);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  // Horizontal Padding
  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets paddingHorizontalS = EdgeInsets.symmetric(horizontal: s);
  static const EdgeInsets paddingHorizontalM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets paddingHorizontalL = EdgeInsets.symmetric(horizontal: l);
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(horizontal: xl);

  // Vertical Padding
  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets paddingVerticalS = EdgeInsets.symmetric(vertical: s);
  static const EdgeInsets paddingVerticalM = EdgeInsets.symmetric(vertical: m);
  static const EdgeInsets paddingVerticalL = EdgeInsets.symmetric(vertical: l);
  static const EdgeInsets paddingVerticalXl = EdgeInsets.symmetric(vertical: xl);

  // Page Padding (commonly used for screen content)
  static const EdgeInsets pagePadding = EdgeInsets.all(m);
  static const EdgeInsets pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets pagePaddingVertical = EdgeInsets.symmetric(vertical: m);

  // Card Padding
  static const EdgeInsets cardPadding = EdgeInsets.all(m);
  static const EdgeInsets cardPaddingSmall = EdgeInsets.all(s);

  // Button Padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: l,
    vertical: s,
  );

  AppSpacing._(); // Private constructor to prevent instantiation
}

import 'package:flutter/material.dart';

/// App color tokens for consistent theming
/// Designed for a fitness/wellness app with calming yet energetic colors
class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF4ECDC4); // Teal - calming yet energetic
  static const Color secondary = Color(0xFFFFB347); // Orange - motivational, warm
  
  // Neutral backgrounds
  static const Color neutralBg = Color(0xFFF9FAFB); // Very light gray
  static const Color white = Color(0xFFFFFFFF);
  
  // Text colors
  static const Color textPrimary = Color(0xFF0F172A); // Dark slate
  static const Color textSecondary = Color(0xFF475569); // Medium slate
  
  // Status colors
  static const Color success = Color(0xFF16A34A); // Green - achievements, progress
  static const Color warning = Color(0xFFF59E0B); // Amber - caution, attention
  static const Color danger = Color(0xFFDC2626); // Red - errors, alerts
  
  // Dark theme colors
  static const Color primaryDark = Color(0xFF45B9B1); // Slightly darker teal
  static const Color surfaceDark = Color(0xFF0B1220); // Very dark blue-gray
  static const Color cardDark = Color(0xFF111827); // Dark gray for cards
  
  // Additional neutral shades for better design flexibility
  static const Color gray50 = Color(0xFFF8FAFC);
  static const Color gray100 = Color(0xFFF1F5F9);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray500 = Color(0xFF64748B);
  static const Color gray600 = Color(0xFF475569);
  static const Color gray700 = Color(0xFF334155);
  static const Color gray800 = Color(0xFF1E293B);
  static const Color gray900 = Color(0xFF0F172A);
  
  // Semantic color variants for different states
  static const Color primaryLight = Color(0xFF7FE4DD); // Lighter teal
  static const Color secondaryLight = Color(0xFFFFD4A3); // Lighter orange
  
  // Background variants
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0B1220);
  static const Color surfaceLight = Color(0xFFF9FAFB);
  
  // Border colors
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);
  
  // Disabled states
  static const Color disabled = Color(0xFF94A3B8);
  static const Color disabledDark = Color(0xFF475569);
  
  AppColors._(); // Private constructor to prevent instantiation
}

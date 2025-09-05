import 'package:flutter/material.dart';

/// Useful extensions for common operations

/// String extensions for validation and formatting
extension StringExtensions on String {
  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Check if string is not null and not empty
  bool get isNotNullOrEmpty {
    return isNotEmpty;
  }

  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Convert to title case
  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }
}

/// BuildContext extensions for easier access to common properties
extension BuildContextExtensions on BuildContext {
  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;
  
  /// Get screen width
  double get screenWidth => screenSize.width;
  
  /// Get screen height
  double get screenHeight => screenSize.height;
  
  /// Check if device is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  
  /// Get theme colors
  ColorScheme get colors => Theme.of(this).colorScheme;
  
  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;
  
  /// Show snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.error : null,
      ),
    );
  }
  
  /// Navigate and remove all previous routes
  void navigateAndClearStack(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }
}

/// DateTime extensions for formatting
extension DateTimeExtensions on DateTime {
  /// Format as readable date string
  String get formattedDate {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }
  
  /// Format as time string
  String get formattedTime {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
  
  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
  
  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }
}

/// Double extensions for weight and measurement formatting
extension DoubleExtensions on double {
  /// Format weight with kg unit
  String get formattedWeight => '${toStringAsFixed(1)} kg';
  
  /// Format height with cm unit
  String get formattedHeight => '${toInt()} cm';
  
  /// Format percentage
  String get formattedPercentage => '${(this * 100).toInt()}%';
}

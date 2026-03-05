import "package:flutter/services.dart";

class HapticHelper {
  static Future<void> light() => HapticFeedback.lightImpact();
  static Future<void> medium() => HapticFeedback.mediumImpact();
  static Future<void> selection() => HapticFeedback.selectionClick();
}

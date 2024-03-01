import 'package:flutter/material.dart';

/// A helper class used to get the current size of the device
class RespQueryHelper {
  /// Buidld context of the widget requesting query
  final BuildContext context;

  /// The constructor that will accept the current build context
  const RespQueryHelper({required this.context});

  /// Get the current width of the device
  double get width {
    return MediaQuery.sizeOf(context).width;
  }

  /// Get a portion of the current device width
  /// (Using percentage value of current device width)
  double getWidth(double percentage) {
    return width * percentage;
  }
}

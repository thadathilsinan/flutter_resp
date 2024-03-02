import 'package:flutter/material.dart';
import 'package:flutter_resp/resp/resp_breakpoints.dart';

/// A helper class used to get the current size of the device
final class RespQueryHelper {
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

  /// Get the current breakpoint of the device
  /// based on the width of the device
  RespBreakpoint get currentBreakpoint {
    final allBreakpoints = RespBreakPointsHelper.getAllBreakpoints(context);
    final currentWidth = width;

    /// Check if the current width is greater than the breakpoint value
    /// in ascending order of the breakpoints to get the current breakpoint
    for (final breakpoint in allBreakpoints) {
      if (currentWidth > breakpoint.value) {
        return breakpoint;
      }
    }

    throw Exception(
        '''Not able to find the breakpoints matching the device width. 
Please check if you have setup your breakpoints properly.''');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_resp/resp/resp_breakpoints_override.dart';

/// Defines the breakpoint to use in the flutter_resp framework
///
/// The default breakpoints used in this framework are listed below:
/// xs (Extra small): below 320px
/// sm (Small): 320px
/// md (Medium): 480px
/// lg (Large): 768px
/// xl (Extra large): 1024px
/// xxl (Double Extra large): 1200px and above
///
/// We can define other breakpoints with a name and a breakpoint width value
final class RespBreakpoint {
  final String name;
  final double value;

  const RespBreakpoint({
    required this.name,
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode => value.hashCode;
}

/// Helper class used to access the breakpoint of the device
final class RespBreakPointsHelper {
  /// This is the list of the default breakpoints used
  static final _defaultBreakPoints = [
    const RespBreakpoint(name: 'xs', value: 0),
    const RespBreakpoint(name: 'sm', value: 320),
    const RespBreakpoint(name: 'md', value: 480),
    const RespBreakpoint(name: 'lg', value: 768),
    const RespBreakpoint(name: 'xl', value: 1024),
    const RespBreakpoint(name: 'xxl', value: 1200),
  ];

  /// Get the sorted list of default breakpoints (Ascending order of the
  /// breakpoint value)
  static List<RespBreakpoint> get _defaultBreakpoints {
    return RespBreakPointsHelper._defaultBreakPoints
      ..sort(
        (a, b) => a.value.compareTo(b.value),
      );
  }

  /// Get the sorted list of custom breakpoints along with the default
  /// breakpoints (Ascending order of the breakpoint value)
  static List<RespBreakpoint> _customBreakpoints(
      List<RespBreakpoint> customBreakpoints) {
    return [...RespBreakPointsHelper._defaultBreakPoints, ...customBreakpoints]
      ..sort(
        (a, b) => a.value.compareTo(b.value),
      );
  }

  /// Get the sorted list of custom breakpoints without the default
  /// breakpoints (Ascending order of the breakpoint value)
  static List<RespBreakpoint> _customBreakpointsWithoutDefaults(
      List<RespBreakpoint> customBreakpoints) {
    return [...customBreakpoints]..sort(
        (a, b) => a.value.compareTo(b.value),
      );
  }

  /// Get the breakpoints after checking if the user has set any overrides to the breakpoints.
  /// The output will contain the custom override set by the user
  ///
  /// The result breakpoints will be sorted based value of the breakpoint
  ///
  /// [context] The build context used to get the inherited widgets with the
  /// breakpoint overrides
  static List<RespBreakpoint> getAllBreakpoints(BuildContext context) {
    /// Check if overrides available
    final override =
        context.dependOnInheritedWidgetOfExactType<RespBreakpointsOverride>();

    if (override != null) {
      /// Get the override data and create the final breakpoints list and return it
      if (override.clearDefaultBreakpoints) {
        return _customBreakpoints(override.breakpoints);
      } else {
        return _customBreakpointsWithoutDefaults(override.breakpoints);
      }
    } else {
      /// No overrides set, so return the default breakpoints
      return _defaultBreakpoints;
    }
  }
}

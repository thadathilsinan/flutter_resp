import 'package:flutter/material.dart';
import 'package:flutter_resp/resp/resp_breakpoints.dart';

/// A widget that is used to override the default breakpoints of the
/// framework
final class RespBreakpointsOverride extends InheritedWidget {
  /// The list of new breakpoints
  final List<RespBreakpoint> breakpoints;

  /// Indicate if the default breakpoints needs to be removed and
  /// add all the given breakpoints as the only breakpoints available.
  ///
  /// Default value is false
  final bool clearDefaultBreakpoints;

  const RespBreakpointsOverride({
    super.key,
    required super.child,
    required this.breakpoints,
    this.clearDefaultBreakpoints = false,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is! RespBreakpointsOverride) {
      return false;
    }

    return false;
  }
}

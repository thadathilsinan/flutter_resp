import 'package:flutter/material.dart';

/// A widget that is used to override the default breakpoints of the
/// framework
class RespBreakpointsOverride extends InheritedWidget {
  const RespBreakpointsOverride({
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is! RespBreakpointsOverride) {
      return false;
    }

    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_resp/resp/resp_breakpoints.dart';
import 'package:flutter_resp/resp/resp_query_helper.dart';

typedef RespValueBuilder<T> = T Function(dynamic common);

/// Create a value based on the current screen size
///
/// Allows the users adjust the values based on breakpoints
/// to make the UI responsive
final class RespValue<T> {
  /// The default breakpoints of the device
  final T? xs;
  final T? sm;
  final T? md;
  final T? lg;
  final T? xl;
  final T? xxl;

  /// Custom breakpoints
  /// The key should be the name of the breakpoint and the value should be the
  /// value that needs to be used for that breakpoint
  final Map<String, T>? others;

  /// The build context of the widget.
  /// This is used to get the current width of the screen as well as the
  /// breakpoints set by the user
  final BuildContext context;

  /// Constructor for creating a responsive value
  const RespValue(
    this.context, {
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.others,
  });

  /// A builder that allows users to use builder pattern to create a responsive value.
  /// This will also allow the users to have a common value for all breakpoints that can
  /// be accessed using the parameter 'common' of the builder.
  RespValue.builder(
    this.context, {
    RespValueBuilder<T>? xs,
    RespValueBuilder<T>? sm,
    RespValueBuilder<T>? md,
    RespValueBuilder<T>? lg,
    RespValueBuilder<T>? xl,
    RespValueBuilder<T>? xxl,
    Map<String, RespValueBuilder<T>>? others,
    dynamic common,
  })  : xs = xs?.call(common),
        sm = sm?.call(common),
        md = md?.call(common),
        lg = lg?.call(common),
        xl = xl?.call(common),
        xxl = xxl?.call(common),
        others = others?.map((key, value) => MapEntry(key, value(common)));

  T get value {
    final currentBreakpoint =
        RespQueryHelper(context: context).currentBreakpoint;

    /// Create a map with all of the brakpoints values
    final allValues = <String, T?>{if (others != null) ...others!};

    if (xs != null) {
      allValues['xs'] = xs;
    }
    if (sm != null) {
      allValues['sm'] = sm;
    }
    if (md != null) {
      allValues['md'] = md;
    }
    if (lg != null) {
      allValues['lg'] = lg;
    }
    if (xl != null) {
      allValues['xl'] = xl;
    }
    if (xxl != null) {
      allValues['xxl'] = xxl;
    }

    for (final breakpoint
        in RespBreakPointsHelper.getAllBreakpoints(context).reversed) {
      /// Look for any breakpoints that are lesser than or equal to the
      /// current breakpoint
      if (breakpoint.value > currentBreakpoint.value) {
        continue;
      }

      /// If there is a value specified for the breakpoint, then use that value and stop the loop
      if (allValues.containsKey(breakpoint.name)) {
        return allValues[breakpoint.name]!;
      }
    }

    /// No value suitable for the current breakpoint found
    throw Exception(
        'Cannot find value for the current breakpoint. Current Breakpoint (Name: ${currentBreakpoint.name}, Value: ${currentBreakpoint.value})');
  }
}

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
class RespBreakpoint {
  final String name;
  final double value;

  const RespBreakpoint({
    required this.name,
    required this.value,
  });
}

/// The default breakpoint used  in the framework
///
/// This class can be use to access the default breakpoints used in the
/// flutter_resp
class RespDefaultBreakPoints {
  /// This is the list of the default breakpoints used
  static final _defaultBreakPoints = [
    const RespBreakpoint(name: 'xs', value: 0),
    const RespBreakpoint(name: 'sm', value: 320),
    const RespBreakpoint(name: 'md', value: 480),
    const RespBreakpoint(name: 'lg', value: 768),
    const RespBreakpoint(name: 'xl', value: 1024),
    const RespBreakpoint(name: 'xxl', value: 1200),
  ];

  /// Get the sorted list of breakpoints (Ascending order of the
  /// breakpoint value)
  List<RespBreakpoint> get defaultBreakpoints {
    return RespDefaultBreakPoints._defaultBreakPoints
      ..sort(
        (a, b) => a.value.compareTo(b.value),
      );
  }
}

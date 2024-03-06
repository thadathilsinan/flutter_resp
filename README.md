# Flutter Resp

Easy to use responsive frawork for flutter. This framework is inspired from the Tailwind CSS Responsive system.

Here by default users will get some breakpoints **xs**(Extra small), **sm**(Small), **md**(Medium), **lg**(Large), **xl**(Extra large), **xxl**(Double extra large).

If the current screen size is greater than the given breakpoint, then the value specified for that particular breakpoint will be used in our app.

Lower breakpoint values will be overridden by the higher breakpoint values

To specify a value like Padding, Width, Height, Color, etc bases on the screen size, you need to wrap it with **RespValue** class and use the **value** getter of the object, based on the current screen size it will take a value from all of the specified values.

Example:

```dart
import 'package:flutter_resp/flutter_resp.dart';

Text(
	RespValue(
		xs: 'Extra small screen',
		sm: 'Small Screen',
		md: 'Medium screen',
		lg: 'Large Screen',
		xl: 'Extra Large Screen',
		xxl: '2 Extra Large Screen',
	).value
)
```

We can also create custom breakpoints using the **RespBreakpointsOverride()** widget. Just wrap the parent widget with this widget and provide your Custom breakpoints. If needed we can clear all of the built in breakpoints and give new breakpoints.

```dart
import 'package:flutter_resp/flutter_resp.dart';

Scaffold(
	RespBreakpointsOverride(
		clearDefaultBreakpoints: true,
		breakpoints: [
			RespBreakpoint(
				name: 'customBreakpoint',
				value: 300,	/// The width of the screen to activate this breakpoints
			)
		],
		child: <CHILD WIDGET TREE> ,
	)
)
```

If you find any bugs or need to have any new feature please raise an issue in the Github issue tracker

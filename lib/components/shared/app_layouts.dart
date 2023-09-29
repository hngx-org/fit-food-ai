import 'package:flutter/material.dart';

enum DeviceScreen { mobileLayout, tabletLayout }

class ScreenInfo {
  final Orientation? orientation;
  final DeviceScreen? deviceScreen;
  final Size? screenSize;
  final Size? localWidgetSize;

  ScreenInfo({
    this.orientation,
    this.deviceScreen,
    this.screenSize,
    this.localWidgetSize,
  });
}

//Creating a responsive architecture
//using breakpoints provided for each device
class Responsive extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenInfo screenInfo) builder;
  const Responsive({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, constraints) {
      var screenInfo = ScreenInfo(
          deviceScreen: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          orientation: mediaQuery.orientation,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight));
      return builder(context, screenInfo);
    });
  }
}

//Setting DeviceTypes with device breakpoints
DeviceScreen getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = mediaQuery.size.shortestSide;
  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 600) {
    return DeviceScreen.tabletLayout;
  }
  return DeviceScreen.mobileLayout;
}

//Setting ScreenLayout based on breakpoints
//provided by responsive builder
class ScreenLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  const ScreenLayout({
    Key? key,
    this.mobile,
    this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: ((context, screenInfo) {
        if (screenInfo.deviceScreen == DeviceScreen.tabletLayout) {
          return tablet!;
        }
        return mobile!;
      }),
    );
  }
}

//Creates an orientation layout for different screen sizes
class OrientationLayout extends StatelessWidget {
  final Widget? landscape, portrait;
  const OrientationLayout({
    super.key,
    this.landscape,
    this.portrait,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape!;
    }
    return portrait!;
  }
}

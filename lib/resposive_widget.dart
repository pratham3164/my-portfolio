import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  ResponsiveWidget(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen});

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 800 &&
      MediaQuery.of(context).size.width > 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800)
        return largeScreen;
      else if (constraints.maxWidth > 800 && constraints.maxWidth > 800)
        return mediumScreen ?? largeScreen;
      else
        return smallScreen ?? largeScreen;
    });
  }
}

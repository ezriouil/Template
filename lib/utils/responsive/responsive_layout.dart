import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class ResponsiveLayout extends Responsive {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const ResponsiveLayout({
    Key? key,
    required this.web,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  @override
  Widget execute(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      switch (constraints.maxWidth) {
        case >= 1100:
          return web;
        case >= 650 && < 1100:
          return tablet;
        default:
          return mobile;
      }
    });
  }
}

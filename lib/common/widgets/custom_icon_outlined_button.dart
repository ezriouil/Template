import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomIconOutlinedButton extends Responsive {
  final String icon;
  final double size;
  final GestureTapCallback onClick;

  const CustomIconOutlinedButton(
      {super.key, required this.icon, this.size = 30.0, required this.onClick});

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: grayColor(context)),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            icon,
            height: size,
            width: size,
          ),
        ),
      ),
    );
  }
}

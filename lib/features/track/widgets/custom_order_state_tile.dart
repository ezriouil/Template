import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomOrderStateTile extends Responsive {
  final Color color;
  final IconData icon;

  const CustomOrderStateTile({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget execute(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(30)),
      child: Icon(icon, color: color),
    );
  }
}

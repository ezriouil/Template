import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomQuestionResponseAnimated extends Responsive {
  final String question, response;

  const CustomQuestionResponseAnimated(
      {super.key, required this.question, required this.response});

  @override
  Widget execute(BuildContext context) {
    return ExpansionTile(
      title: Text(question, style: Theme.of(context).textTheme.titleMedium),
      iconColor: darkLightColor(context),
      textColor: darkLightColor(context),
      expandedAlignment: Alignment.centerLeft,
      children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(response, style: Theme.of(context).textTheme.bodySmall),
      )],
    );
  }
}

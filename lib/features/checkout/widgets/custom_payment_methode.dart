import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomPaymentMethode extends Responsive {
  final Function(String?) onSelectedOffline, onSelectedOnline;
  final String selectedValue;

  const CustomPaymentMethode(
      {super.key,
      required this.selectedValue,
      required this.onSelectedOffline,
      required this.onSelectedOnline});

  @override
  Widget execute(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getWidth(context),
      height: getHeight(context) * 0.3,
      padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
      decoration: BoxDecoration(
        color: darkDarkLightLightColor(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
          topRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: 0),
                  trailing: Image.asset(
                      CustomIconStrings.PAYMENTS_METHOD_ONLINE,
                      height: 50,
                      width: 50,
                      color: darkLightColor(context)),
                  title: Text("Online",
                      style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio<String>(
                      value: "Online",
                      groupValue: selectedValue,
                      fillColor:
                          MaterialStateProperty.all(primaryColor(context)),
                      splashRadius: 20,
                      onChanged: onSelectedOnline),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: 0),
                  trailing: Image.asset(
                    CustomIconStrings.CASH_ON_DELIVERY,
                    height: 40,
                    width: 40,
                    alignment: Alignment.centerLeft,
                    color: darkLightColor(context),
                  ),
                  title: Text("Offline",
                      style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio<String>(
                      value: "Offline",
                      groupValue: selectedValue,
                      fillColor:
                          MaterialStateProperty.all(primaryColor(context)),
                      splashRadius: 25,
                      onChanged: onSelectedOffline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

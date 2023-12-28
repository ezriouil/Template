import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_outlined_button.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomDialog extends Responsive {
  final String title, subTitle, buttonLeftTitle, buttonRightTitle;
  final GestureTapCallback onButtonLeftClick, onButtonRightClick;

  const CustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonLeftTitle,
    required this.buttonRightTitle,
    required this.onButtonLeftClick,
    required this.onButtonRightClick,
  });

  @override
  Widget execute(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getWidth(context),
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
      decoration: BoxDecoration(
        color: darkDarkLightLightColor(context),
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomOutlinedButton(
                      text: buttonLeftTitle,
                      onClick: onButtonLeftClick,
                      width: getWidth(context),
                      withDefaultPadding: false,
                    )),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                    flex: 1,
                    child: CustomOutlinedButton(
                      text: buttonRightTitle,
                      onClick: onButtonRightClick,
                      width: getWidth(context),
                      withDefaultPadding: false,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

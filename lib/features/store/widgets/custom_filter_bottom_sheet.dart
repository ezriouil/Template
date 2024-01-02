import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_settings_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomFilterBottomSheet extends Responsive {
  final List<Color> colors;
  final List<String> categories;
  final Function(Color) onColorChange;
  final Function(String) onCategoryChange;
  final Color? colorSelected;
  final String? categorySelected;
  final GestureTapCallback onFilter;

  const CustomFilterBottomSheet({
    super.key,
    required this.colors,
    required this.categorySelected,
    required this.categories,
    required this.colorSelected,
    required this.onColorChange,
    required this.onCategoryChange,
    required this.onFilter,
  });

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
      decoration: BoxDecoration(
        color: darkDarkLightLightColor(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
          topRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          onCategoryChange(categories[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: categories[index] == categorySelected ? darkLightColor(context) : darkDarkLightLightColor(context) ,
                              border: Border.all(
                                  color: darkLightColor(context))),
                          padding: const EdgeInsets.all(
                              CustomSizes.SPACE_BETWEEN_ITEMS / 1.5),
                          margin: const EdgeInsets.symmetric(
                              horizontal:
                                  CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          child: Image.asset(categories[index], height: 26,width: 26,
                              color: categories[index] == categorySelected ? darkDarkLightLightColor(context) : darkLightColor(context)),
                        ),
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Text("Color", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          onColorChange(colors[index]);
                        },
                        child: Container(
                            decoration:  BoxDecoration(
                                color: colors[index],
                                border: Border.all(
                                    color: darkLightColor(context),
                                    width: colorSelected == colors[index]
                                        ? 3.0
                                        : 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(
                                CustomSizes.SPACE_BETWEEN_ITEMS),
                            margin: const EdgeInsets.symmetric(
                                horizontal:
                                    CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            child: Icon(
                                colorSelected == colors[index]
                                    ? Icons.check
                                    : null,
                                color: colors[index] == CustomColors.WHITE
                                    ? CustomColors.BLACK
                                    : CustomColors.WHITE)),
                      )),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Text("More..", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            CustomSettingTile(
                icon: Icons.library_add_check_outlined,
                title: "Available",
                subTitle: "Filter available products",
                trailing: Switch(value: true, onChanged: (value) {}),
                onClick: () {}),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            CustomSettingTile(
                icon: Iconsax.ticket_discount,
                title: "Has Discount",
                subTitle: "Filter products has discount",
                trailing: Switch(value: true, onChanged: (value) {}),
                onClick: () {}),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/2),
            CustomElevatedButton(
              text: "Filter",
              onClick: onFilter,
              width: getWidth(context),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          ],
        ),
      ),
    );
  }
}

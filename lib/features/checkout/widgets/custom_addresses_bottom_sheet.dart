import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/features/location_address/widgets/custom_address_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomAddressBottomSheet extends Responsive {
  final Function(LocationAddress) onSelected;
  final LocationAddress? locationAddress;
  final List<LocationAddress>? locationAddresses;

  const CustomAddressBottomSheet({
    super.key,
    required this.onSelected,
    required this.locationAddresses,
    required this.locationAddress,
  });

  @override
  Widget execute(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: getWidth(context),
        height: getHeight(context) * 0.6,
        padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
        decoration: BoxDecoration(
          color: darkDarkLightLightColor(context),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
            topRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
          ),
        ),
        child: Obx(
          () => ListView.builder(
              itemCount: locationAddresses!.length,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) =>
                  CustomAddressTile(
                      onDelete: () {},
                      onSelected: onSelected,
                      selectedAddressBackgroundColor:
                          locationAddresses![index] == locationAddress
                              ? grayColor(context)
                              : CustomColors.TRANSPARENT,
                      address: locationAddresses![index])),
        ),
      ),
    );
  }
}

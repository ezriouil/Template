import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomAddressTile extends Responsive {
  final GestureTapCallback onDelete;
  final Function(LocationAddress)? onSelected;
  final LocationAddress address;
  final Color? selectedAddressBackgroundColor;

  const CustomAddressTile(
      {super.key,
      required this.onDelete,
      required this.address,
      this.selectedAddressBackgroundColor,
      this.onSelected});

  @override
  Widget execute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
          horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      child: InkWell(
        onTap: onSelected == null ? null : () => onSelected!(address),
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
          decoration: BoxDecoration(
              color: onSelected == null ? null : selectedAddressBackgroundColor,
              borderRadius:
                  BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
              border: Border.all(color: darkLightColor(context))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Iconsax.location, color: primaryColor(context)),
                  Text(" ${address.title}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: primaryColor(context))),
                  const Spacer(),
                  InkWell(
                      onTap: onDelete,
                      child: Icon(
                          onSelected == null ? Iconsax.trush_square4 : null,
                          color: darkLightColor(context))),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS /2),
              Text(address.fullName!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Text(address.phone!,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Text(
                  "${address.fullAddress}, ${address.city}, ${address.nearby}, ${address.zipCode}, ${address.state}, ${address.country}.",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

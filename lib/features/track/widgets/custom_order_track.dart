import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/order.dart';
import 'package:test1/features/track/widgets/custom_order_state_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomOrderTrack extends Responsive {
  final Order order;

  const CustomOrderTrack({super.key, required this.order});

  @override
  Widget execute(BuildContext context) {
    final divider = Divider(
        color: grayColor(context),
        indent: getWidth(context) / 8,
        endIndent: getWidth(context) / 8);
    return Card(
      elevation: isDark(context) ? 12 : 8,
      color: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Iconsax.box, color: grayColor(context)),
              Text(order.date!.substring(7),
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          divider,
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          SizedBox(
            width: getWidth(context),
            child: Text(order.order?.replaceAll(",", "\n") ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: primaryColor(context))),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          divider,
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: const Icon(Iconsax.user, size: 20),
            title: Text(order.locationAddress?.fullName ?? "",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: const Icon(Iconsax.call, size: 20),
            title: Text(order.locationAddress?.phone ?? "",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: const Icon(Iconsax.location, size: 20),
            title: Text(
                "${order.locationAddress?.fullAddress ?? ""}, ${order.locationAddress?.city ?? ""}, ${order.locationAddress?.nearby ?? ""}, ${order.locationAddress?.zipCode ?? ""}, ${order.locationAddress?.state ?? ""}, ${order.locationAddress?.country ?? ""}.",
                style: Theme.of(context).textTheme.bodyMedium),
          ),

          const SizedBox(height: CustomSizes.SPACE_DEFAULT),

          // - - - - - - - - - - - - - - - - - - CUSTOM TRUCKING ORDER - - - - - - - - - - - - - - - - - -  //
          Row(

            children: [
              // - - - - - - - - - - - - - - - - - - CANCELED STATE - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: CustomOrderStateTile(
                      icon: Icons.cancel_outlined,
                      color: order.orderState! == "CANCELED"
                          ? primaryColor(context)
                          : grayColor(context))),

              // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: Divider(
                endIndent: 4,
                indent: 4,
                color: order.orderState! == "CANCELED"
                    ? primaryColor(context)
                    : grayColor(context),
              )),

              // - - - - - - - - - - - - - - - - - - WAITING STATE - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: CustomOrderStateTile(
                      icon: Icons.timer_outlined,
                      color: order.orderState! == "WAITING"
                          ? primaryColor(context)
                          : grayColor(context))),

              // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: Divider(
                endIndent: 4,
                indent: 4,
                color: order.orderState! == "ROAD"
                    ? primaryColor(context)
                    : grayColor(context),
              )),

              // - - - - - - - - - - - - - - - - - - ON THE ROAD STATE - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: CustomOrderStateTile(
                      icon: Icons.local_shipping_outlined,
                      color: order.orderState! == "ROAD"
                          ? primaryColor(context)
                          : grayColor(context))),

              // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: Divider(
                endIndent: 4,
                indent: 4,
                color: order.orderState! == "CONFIRMED"
                    ? primaryColor(context)
                    : grayColor(context),
              )),

              // - - - - - - - - - - - - - - - - - - CONFIRMED STATE - - - - - - - - - - - - - - - - - -  //
              Expanded(
                  child: CustomOrderStateTile(
                      icon: Icons.check,
                      color: order.orderState! == "CONFIRMED"
                          ? primaryColor(context)
                          : grayColor(context))),

            ],
          )
        ]),
      ),
    );
  }
}

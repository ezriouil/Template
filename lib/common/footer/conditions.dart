import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class Conditions extends Responsive {
  const Conditions({super.key});

  @override
  Widget execute(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Conditions", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 1.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToCookies(context),
          child: Text("   Cookies",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToSecurity(context),
          child: Text("   Security",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToPaymentMethodsOnline(context),
          child: Text(
            "   Payment methods (online)",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToPaymentMethodsOffline(context),
          child: Text(
            "   Payment methods (offline)",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToFAQ(context),
          child: Text("   FAQ", style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToShipping(context),
          child: Text("   Shipping",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToStoreHistory(context),
          child: Text(
            "   Store history",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.7),
        InkWell(
          onTap: () => NavigateIn.onNavigateToMobileApplication(context),
          child: Text("   Mobile application",
              style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
    );
  }
}

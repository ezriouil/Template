import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/localization_address/localization_address_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileLocalizationAddress extends Responsive {
  const MobileLocalizationAddress({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocalizationAddressController controller =
        Get.put(LocalizationAddressController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: ()=>Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
              horizontal: CustomSizes.SPACE_DEFAULT),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's create new address",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - USER NAME - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.user,
                      hint: CustomTextStrings.USER_NAME,
                      controller: controller.userNameController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.USER_NAME, value),
                      width: getWidth(context),
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - FULL ADDRESS - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.location,
                      hint: CustomTextStrings.FULL_ADDRESS,
                      controller: controller.fullAddressController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.FULL_ADDRESS, value),
                      width: getWidth(context),
                      textInputType: TextInputType.text,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - NEARBY - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.location_add,
                      hint: CustomTextStrings.Nearby,
                      controller: controller.nearbyController,
                      validator: null,
                      width: getWidth(context),
                      textInputType: TextInputType.text,
                      withDefaultPadding: false),

                  Row(children: [
                    // - - - - - - - - - - - - - - - - - - CITY - - - - - - - - - - - - - - - - - -  //

                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                          leadingIcon: Iconsax.gps,
                          hint: CustomTextStrings.CITY,
                          controller: controller.cityController,
                          validator: (value) => Validator.validateEmptyField(
                              CustomTextStrings.CITY, value),
                          width: getWidth(context),
                          textInputType: TextInputType.text,
                          withDefaultPadding: false),
                    ),

                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                    // - - - - - - - - - - - - - - - - - - ZIP CODE - - - - - - - - - - - - - - - - - -  //

                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                          leadingIcon: Iconsax.code,
                          hint: CustomTextStrings.ZIP_CODE,
                          controller: controller.zipCodeController,
                          validator: null,
                          width: getWidth(context),
                          textInputType: TextInputType.number,
                          withDefaultPadding: false),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                          leadingIcon: Iconsax.location_tick,
                          hint: CustomTextStrings.COUNTRY,
                          controller: controller.countryController,
                          validator: null,
                          width: getWidth(context),
                          textInputType: TextInputType.text,
                          withDefaultPadding: false),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                    // - - - - - - - - - - - - - - - - - - STATE CITY - - - - - - - - - - - - - - - - - -  //
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                          leadingIcon: Iconsax.activity,
                          hint: CustomTextStrings.CITY_STATE,
                          controller: controller.stateCityController,
                          validator: null,
                          width: getWidth(context),
                          textInputType: TextInputType.text,
                          withDefaultPadding: false),
                    ),
                  ]),

                  // - - - - - - - - - - - - - - - - - - PHONE - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.call,
                      hint: CustomTextStrings.PHONE,
                      controller: controller.phoneController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.PHONE, value),
                      width: getWidth(context),
                      textInputType: TextInputType.phone,
                      withDefaultPadding: false),

                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  // - - - - - - - - - - - - - - - - - - BUTTON INSERT - - - - - - - - - - - - - - - - - -  //

                  CustomElevatedButton(
                    text: "Insert",
                    onClick: controller.onInsertNewAddress,
                    width: getWidth(context),
                    withDefaultPadding: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "Your info will save into local database every time you want to order something you will found it automatically.",
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

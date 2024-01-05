import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/location_address/location_address_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletAddNewLocationAddressScreen extends Responsive {
  const TabletAddNewLocationAddressScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocationAddressController controller = Get.put(LocationAddressController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: ()=>Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            size: 40,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS,
              horizontal: CustomSizes.SPACE_DEFAULT),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's create new address",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 40)),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - ADDRESS TITLE - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.text,
                      hint: CustomTextStrings.ADDRESS_TITILE,
                      controller: controller.titleController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.ADDRESS_TITILE, value),
                      height: CustomSizes.TABLET_TEXT_FIELD,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - USER NAME - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.user,
                      hint: CustomTextStrings.USER_NAME,
                      controller: controller.userNameController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.USER_NAME, value),
                      height: CustomSizes.TABLET_TEXT_FIELD,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - FULL ADDRESS - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.location,
                      hint: CustomTextStrings.FULL_ADDRESS,
                      controller: controller.fullAddressController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.FULL_ADDRESS, value),
                      height: CustomSizes.TABLET_TEXT_FIELD,
                      textInputType: TextInputType.text,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - NEARBY - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.location_add,
                      hint: CustomTextStrings.Nearby,
                      controller: controller.nearbyController,
                      validator: null,
                      height: CustomSizes.TABLET_TEXT_FIELD,
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
                          height: CustomSizes.TABLET_TEXT_FIELD,
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
                          height: CustomSizes.TABLET_TEXT_FIELD,
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
                          height: CustomSizes.TABLET_TEXT_FIELD,
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
                          height: CustomSizes.TABLET_TEXT_FIELD,
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
                      height: CustomSizes.TABLET_TEXT_FIELD,
                      textInputType: TextInputType.phone,
                      withDefaultPadding: false),

                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  // - - - - - - - - - - - - - - - - - - BUTTON INSERT - - - - - - - - - - - - - - - - - -  //

                  CustomElevatedButton(
                    text: "Insert",
                    onClick: controller.onInsertNewAddress,
                    height: CustomSizes.TABLET_ELEVATED_BUTTON,
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

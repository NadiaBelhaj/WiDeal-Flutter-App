import 'package:wideal_app_flutter/core/view_model/checkout_viewmodel.dart';
import 'package:wideal_app_flutter/view/checkout/checkout_view.dart';
import 'package:wideal_app_flutter/view/widgets/custom_text.dart';
import 'package:wideal_app_flutter/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomText(
                    text: 'Billing address',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.street1 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'you must write your street';
                      }
                    },
                    text: "Street 1",
                    hint: "Street 1",
                  ),

                  //2
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.street2 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'you must write your Street 2';
                      }
                    },
                    text: "Street 2",
                    hint: "Street 2",
                  ),

                  //3

                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: "City",
                    hint: "City",
                    onSave: (value) {
                      controller.city = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'you must write your City';
                      }
                    },
                  ),

                  //4
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFormField(
                              text: 'State',
                              hint: 'State',
                              onSave: (value) {
                                controller.state = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'you must write your State';
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextFormField(
                              text: 'Country',
                              hint: 'Country',
                              onSave: (value) {
                                controller.country = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'you must write your Country';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

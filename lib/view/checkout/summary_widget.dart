import 'package:wideal_app_flutter/constance.dart';
import 'package:wideal_app_flutter/core/view_model/cart_viewmodel.dart';
import 'package:wideal_app_flutter/core/view_model/checkout_viewmodel.dart';
import 'package:wideal_app_flutter/view/control_view.dart';
import 'package:wideal_app_flutter/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: controller.cartProductModel[index].name),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          color: primaryColor,
                          text:
                              '\TND ${controller.cartProductModel[index].price.toString()}',
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Shipping address',
                fontSize: 24,
              ),
            ),
            GetBuilder<CheckOutViewModel>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  fontSize: 24,
                  color: Colors.grey,
                  text:
                      '${controller.street1 + ',' + controller.street2 + ',' + controller.state + ',' + controller.city + ',' + controller.country}',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

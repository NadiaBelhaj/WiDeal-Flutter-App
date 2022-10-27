import 'package:wideal_app_flutter/constance.dart';
import 'package:wideal_app_flutter/helper/enum.dart';
import 'package:wideal_app_flutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //SizedBox(
          //height: 50,
          //),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3-5 days',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),

//2 RADIO

          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Next day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nPlace your order before 6am',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),

          //3rd Radio Button

          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NomnatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Nominated  Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nPick a date from the calendar',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../product_details.dart';

class ProductInfo extends StatelessWidget {
  final String _image;
  final String _title;
  final String _description;
  final int _price;
  final int _quantity;

  const ProductInfo(
      this._image, this._title, this._description, this._price, this._quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductDetails(_image, _title, _description, _price, _quantity);
            },
          ));
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Image.network("http://10.0.2.2:9090/img/" + _image, width: 200, height: 94),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_title),
                const SizedBox(
                  height: 10,
                ),
                Text(_price.toString() + " TND", textScaleFactor: 2)
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetails extends StatefulWidget {
  final String _image;
  final String _title;
  final String _description;
  final int _price;
  final int _quantity;

  const ProductDetails(
      this._image, this._title, this._description, this._price, this._quantity);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final String _baseUrl = "10.0.2.2:9090";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Image.network("http://10.0.2.2:9090/img/" + widget._image, width: 460, height: 215)
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._description),
          ),
          Text(widget._price.toString() + " TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : " + widget._quantity.toString()),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_basket_rounded),
        label: const Text("Acheter", textScaleFactor: 1.5,),
        onPressed: () {
          http.get(Uri.http(_baseUrl, "/library/" + "61b20288685c0720699ece43" + "/" + "61b20288685c0720699ece38"))
              .then((http.Response response) {
                Map<String, dynamic> dataFromServer = json.decode(response.body);
                if(dataFromServer["count"] != 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        title: Text("Information"),
                        content: Text("Vous possédez déjà ce jeu !"),
                      );
                    },
                  );
                }
                else {
                  Navigator.pop(context);
                }
          });
        },
      ),
    );
  }
}

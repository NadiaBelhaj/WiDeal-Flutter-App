import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferDetails extends StatefulWidget {
  final String _image;
  final String _title;
  final String _description;
  final String _price;
  final String _type;

  const OfferDetails(
      this._image, this._title, this._description, this._price, this._type);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  final String _baseUrl = "172.17.7.126:3000";

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
              child: Image.network(
                  "http://172.17.7.126:3000/img/" + widget._image,
                  width: 460,
                  height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._description),
          ),
          Text(widget._price.toString() + " TND", textScaleFactor: 3),
          Text("Type : " + widget._type.toString()),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_basket_rounded),
        label: const Text(
          "Acheter",
          textScaleFactor: 1.5,
        ),
        onPressed: () {
          http
              .get(Uri.http(
                  _baseUrl,
                  "/library/" +
                      "61b20288685c0720699ece43" +
                      "/" +
                      "61b20288685c0720699ece38"))
              .then((http.Response response) {
            Map<String, dynamic> dataFromServer = json.decode(response.body);
            if (dataFromServer["count"] != 0) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("Information"),
                    content: Text("Vous possédez déjà ce jeu !"),
                  );
                },
              );
            } else {
              Navigator.pop(context);
            }
          });
        },
      ),
    );
  }
}

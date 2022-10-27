import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product_infonew.dart';

class Homenew extends StatefulWidget {
  const Homenew({Key? key}) : super(key: key);

  @override
  State<Homenew> createState() => _HomenewState();
}

class _HomenewState extends State<Homenew> {
  //final List<GameData> _games = [];
  final List<OfferData> _games = [];

  final String _baseUrl = "172.17.7.126:3000";
//10.0.2.2
  late Future<bool> fetchedGames;

  Future<bool> fetchGames() async {
    http.Response response = await http.get(Uri.http(_baseUrl, "/api/offer"));

    List<dynamic> gamesFromServer = json.decode(response.body);
    for (int i = 0; i < gamesFromServer.length; i++) {
      _games.add(OfferData(
          gamesFromServer[i]["_id"],
          gamesFromServer[i]["name"],
          gamesFromServer[i]["description"],
          gamesFromServer[i]["image"],
          gamesFromServer[i]["price"],
          gamesFromServer[i]["latitude"],
          gamesFromServer[i]["longitude"],
          gamesFromServer[i]["type"],
          gamesFromServer[i]["datedebut"],
          gamesFromServer[i]["datefin"]));
    }

    return true;
  }

  @override
  void initState() {
    fetchedGames = fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchedGames,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: _games.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductInfo(
                  _games[index].image,
                  _games[index].name,
                  _games[index].description,
                  _games[index].price,
                  _games[index].type);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

/*
class GameData {
  final String id;
  final String title;
  final String image;
  final String description;
  final int price;
  final int quantity;

  GameData(this.id, this.title, this.image, this.description, this.price,
      this.quantity);

  @override
  String toString() {
    return 'GameData{id: $id, title: $title, image: $image, description: $description, price: $price, quantity: $quantity}';
  }
}

*/
class OfferData {
  final String id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String latitude;
  final String longitude;
  final String type;
  final String datedebut;
  final String datefin;

  OfferData(this.id, this.name, this.description, this.image, this.price,
      this.latitude, this.longitude, this.type, this.datedebut, this.datefin);

  @override
  String toString() {
    return 'OfferData{id: $id, title: $name, image: $image, description: $description, price: $price, dated: $datedebut, datef:$datefin}';
  }
}

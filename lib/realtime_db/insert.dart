import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wideal_app_flutter/core/view_model/profile_view_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  @override
  State<RealtimeDatabaseInsert> createState() => _RealtimeDatabaseInsertState();
}

class _RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
  var nameController = new TextEditingController();
  var priceController = new TextEditingController();
  var sizedController = new TextEditingController();
  var imageController = new TextEditingController();

  var descriptionController = new TextEditingController();
  var colorController = new TextEditingController();

  var user = ProfileViewModel().getCurrentUser();
  //var cityController = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  String name, price, sized, color, description, image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Insert Data:",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
            //2

            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                description = value;
              },
              controller: descriptionController,
              decoration: InputDecoration(
                  labelText: 'description', border: OutlineInputBorder()),
            ),

            //3

            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                color = value;
              },
              controller: colorController,
              decoration: InputDecoration(
                  labelText: 'Color', border: OutlineInputBorder()),
            ),

//4

            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                image = value;
              },
              controller: imageController,
              decoration: InputDecoration(
                  labelText: 'image', border: OutlineInputBorder()),
            ),

            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                price = value;
              },
              controller: priceController,
              decoration: InputDecoration(
                  labelText: 'price', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 50,
            ),
            OutlineButton(
                onPressed: () async {
                  /* if (nameController.text.isEmpty &&
                      priceController.text.isEmpty &&
                      sizedController.text.isEmpty &&
                      colorController.text.isEmpty &&
                      descriptionController.text.isEmpty &&
                      imageController.text.isEmpty) {
                    insertData(
                        nameController.text,
                        priceController.text,
                        sizedController.text,
                        colorController.text,
                        descriptionController.text,
                        imageController.text);
                  }*/

                  products.add({
                    'name': name,
                    'price': price,
                    'sized': "sized",
                    'color': color,
                    'description': description,
                    'image': image,
                    'productId': getStringValuesSF().toString(),
                    //'user': getStringValuesSF(),
                    //'productId': databaseRef.child("Products").push().key,
                  }).then((value) => print('User added'));
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }

  void insertData(String name, String price, String sized, String color,
      String description, String image) {
    String key = databaseRef.child("Products").push().key;
    databaseRef.child("Products").child(key).set({
      'productId': key,
      'name': name,
      'price': price,
      'sized': sized,
      'color': color,
      'description': description,
      'image': image,
      'user': getStringValuesSF(),
    });
    nameController.clear();
    priceController.clear();
    sizedController.clear();

    colorController.clear();
    descriptionController.clear();
    imageController.clear();
    //sizedController.clear();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('userr');
    return stringValue;
  }
}

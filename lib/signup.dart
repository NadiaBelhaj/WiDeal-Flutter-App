import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String? _image;

  late String? _username;
  late String? _email;
  late String? _pwd;
  //
  late String? _cpwd;
  late String? _phone;
//
  late String? _latitude;
  late String? _longitude;
  late String? _gendre;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //final String _baseUrl = "10.0.2.2:9090";
// 192.168.1.11:3000

  final String _baseUrl = "172.17.7.126:3000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Image"),
                onSaved: (String? value) {
                  _image = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Le User doit avoir une image";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "gendre"),
                onSaved: (String? value) {
                  _gendre = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 5) {
                    return "Le gender doit avoir au moins 5 caractères !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 5) {
                    return "Le Username doit avoir au moins 5 caractères !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                onSaved: (String? value) {
                  _email = value;
                },
                validator: (String? value) {
                  RegExp regex = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (value!.isEmpty || !regex.hasMatch(value)) {
                    return "L'adresse email n'est pas valide !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
                onSaved: (String? value) {
                  _pwd = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirmer Mot de passe"),
                onSaved: (String? value) {
                  _cpwd = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "phone"),
                onSaved: (String? value) {
                  _phone = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 5) {
                    return "phone number est invalide !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Latitude"),
                onSaved: (String? value) {
                  _latitude = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Latitude is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Longitude"),
                onSaved: (String? value) {
                  _longitude = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Longitude is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("S'inscrire"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Map<String, dynamic> userData = {
                        "name": _username,
                        "password": _pwd,
                        "confirmPassword": _cpwd,
                        "email": _email,
                        "phone": _phone,
                        "latitude": _latitude,
                        "longitude": _longitude,
                        "image": _image,
                        "gendre": _gendre
                      };

                      Map<String, String> headers = {
                        "Content-Type": "application/json; charset=UTF-8"
                      };

                      http
                          .post(
                              Uri.http(
                                  _baseUrl, "/api/authentification/register"),
                              headers: headers,
                              body: json.encode(userData))
                          .then((http.Response response) {
                        if (response.statusCode == 201) {
                          Navigator.pushReplacementNamed(context, "/");
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Information"),
                                  content: Text(
                                      "Une erreur s'est produite. Veuillez réessayer !"),
                                );
                              });
                        }
                      });
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Annuler"),
                  onPressed: () {
                    _formKey.currentState!.reset();
                    Navigator.pushReplacementNamed(context, "/");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

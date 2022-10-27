import 'package:flutter/material.dart';
import 'package:workshop_sim4/basket/basket.dart';
import 'package:workshop_sim4/home/home.dart';
import 'package:workshop_sim4/home/homenew.dart';
import 'package:workshop_sim4/my_games/my_games.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Store",
              ),
              Tab(
                icon: Icon(Icons.article),
                text: "Bibliothèque",
              ),
              Tab(
                icon: Icon(Icons.shopping_basket_rounded),
                text: "Panier",
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                title: const Text("G-Store ESPRIT"),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Modifier profil")
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/home/updateUser");
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.vertical_align_bottom),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Navigation du bas")
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [Homenew(), MyGames(), Basket()],
        ),
      ),
    );
  }
}

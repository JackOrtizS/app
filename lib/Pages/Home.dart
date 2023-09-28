import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.tealAccent),
                  child: Column(
                children: [Text("Usuario"),Image.network(
                  "https://w7.pngwing.com/pngs/276/546/png-transparent-computer-icons-user-others-miscellaneous-black-svg.png",
                  width: 100,
                )],

              )
              ),
              ListTile(
                leading: Icon(Icons.monetization_on_outlined),
                title:Text("Rifas"),
                onTap: (){},
              ),

              ListTile(
                leading: Icon(Icons.add_card_rounded),
                title:Text("Boletos Apartados"),
                onTap: (){},
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("Home"),
        ));
  }
}

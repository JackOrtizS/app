import 'package:app/Pages/AddRifa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                    children: [
                      Text("Usuario"),
                      Image.network(
                        "https://w7.pngwing.com/pngs/276/546/png-transparent-computer-icons-user-others-miscellaneous-black-svg.png",
                        width: 100,
                      )
                    ],
                  )),
              ListTile(
                leading: Icon(Icons.monetization_on_outlined),
                title: Text("Rifas"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.add_card_rounded),
                title: Text("Boletos Apartados"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("rifas").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }

            List<DocumentSnapshot> docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
                itemBuilder: (context, index){

                final DocumentSnapshot rifa = docs[index];

                return Card(
                 child: ListTile(
                   leading: Icon(Icons.shop),
                   title: Text(rifa['nombre'], style: TextStyle(fontSize: 18 ),),
                   subtitle: Text(rifa['descripcion']),

                   onTap: (){
                     print("hola" + rifa['nombre']);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> AddRifa(idDoc: rifa.id,)),);

                   },
                 ),
                );
                }
            );
          },
        ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      //Navigator.push(context, MaterialPageRoute(builder: (contex)=>AddRifa()),);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddRifa(idDoc: '',)),);

    }, child: Icon(Icons.add),),
    );
  }
}

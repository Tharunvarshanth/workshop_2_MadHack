
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop02task/models/attraction.dart';

import 'detail_view.dart';

class Travel extends StatefulWidget{
  final firestore;
  Travel( this.firestore);



  @override
  _TravelState createState() => _TravelState();


}

class _TravelState extends State<Travel>{



  void initState(){
    super.initState();



  }






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

   return Scaffold(

    body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("attraction").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.data!=null){
               QuerySnapshot snap = snapshot.data;
               List<DocumentSnapshot> documents = snap.docs;
                   return ListView.builder(
                     itemCount: documents.length,
                     itemBuilder: (BuildContext context, int index) {
                     DocumentSnapshot doc = documents[index];

                     return Card(
                       margin: const EdgeInsets.all(5),
                       child: Column(
                        children:<Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15,5,15,5),
                         child: Image.network(
                            doc["image"],
                            fit: BoxFit.contain,
                          ),
                          ),
                          ListTile(
                               onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder:(context)=>DetailView(doc["title"],doc["shortdetail"],doc["image"],doc["description"]))
                                  );
                               },
                               title: Text(doc["title"]),
                               subtitle: Text(doc["shortdetail"]),
                        ),
                       ]
                     )

                     );
                   },
                 );
        }else{
           return CircularProgressIndicator();
        }
   },
    ),
   );
  }


}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget{
   final title;
   final shortdetail;
   final image;
   final description;

   DetailView(this.title,this.shortdetail,this.image,this.description);

  @override
  _DetailViewState createState() => _DetailViewState();


}

class _DetailViewState extends State<DetailView>{

  void initState(){
    super.initState();
    print(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(20, 20, 0,0),
            child: IconButton(
            icon:const Icon(Icons.arrow_back_sharp),
            onPressed: (){
              Navigator.pop(context);
            },
         ),
          ),
              Card(
                  child: Column(
                      children:<Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15,5,15,5),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.contain,
                          ),
                        ),

                        ListTile(

                          title: Text(widget.title),
                          subtitle: Text(widget.description),
                        ),
                      ]
                  )


          )
        ],
      ),
    );
  }
}
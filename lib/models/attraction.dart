

class Attraction{
  final String title;
  final String shortdetail;
  final String image;
  final String description;


  Attraction( this.title,this.shortdetail, this.image, this.description);
/*
  factory Attraction.fromJson(Map<String,dynamic> json){

     return Attraction(
         title:json["title"] as String,
         description: json["description"] as String,
         image: json["image"] as String,
         shortdetail: json["shortdetail"] as String
     );
  }*/
}
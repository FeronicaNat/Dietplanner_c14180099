// import 'package:flutter/material.dart';

class Meal{
   int id;
   String title;
   String imgurl;

   Meal({
     this.id,this.title,this.imgurl

   });

  factory Meal.getfood(Map<String,dynamic> food){
    return Meal(
      id:food['id'],
      title:food['title'],
      imgurl:"https://spoonacular.com/recipeImages/"+food["image"]
      );
  }


}
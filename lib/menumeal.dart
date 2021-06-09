// import 'package:flutter/material.dart';

import 'dart:io';

import 'package:http/http.dart' as http;
import'dart:convert';

class Meal{

   static final String urllink = "api.spoonacular.com";
   static const String API_KEY ="c14712fa2fa34877af487d716778cffd";
   int id;
   String title;
   String imgurl;

   Meal({
     this.id,this.title,this.imgurl

   });

  factory Meal.getfoodmeal(Map<String,dynamic> food){
    return Meal(
      id:food['id'],
      title:food['title'],
      imgurl:"https://spoonacular.com/recipeImages/"+food["id"]+"-636x393."+food["imageType"],

      // https://images.spoonacular.com/file/wximages/644108-636x393.png
      // https://spoonacular.com/recipeImages/744388-636x393.jpg
      );
  }

    static Future<Meal> confoodmeal() async{ //nnti setelah data berhasil diambil

      // Map<String, String> parameters = {
      // 'timeFrame': 'day',
      // 'targetCalories': targetCalories.toString(),
      // 'diet': diet,
      // 'apiKey': API_KEY,
      // };

      String URLapi='https://api.spoonacular.com/recipes/mealplans/generate?timeFrame=day&targetCalories=2000&diet=None&apiKey=c14712fa2fa34877af487d716778cffd';
      // Uri uri = Uri.https(urllink,'/recipes/mealplans/generate',parameters,);

      // var apiResult= await http.get(Uri.parse(URLapi));

      // var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      // var data=(jsonObject as Map<String,dynamic>)['data'];
      // return dataAPI.createData(data);

      try{
      var apiResult = await http.get(Uri.parse(URLapi));
    
      var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      var data=(jsonObject as Map<String,dynamic>);
      Meal foodmeal = Meal.getfoodmeal(data);
      return foodmeal; 
      }catch (err){
        throw err.toString();
      }
      
     
      
  }


}



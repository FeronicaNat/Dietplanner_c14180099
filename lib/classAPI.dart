import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latflutter4menudiet/planmealday.dart';
import'dart:convert';
import 'menumeal.dart';
import 'planmealday.dart';
// import 'resep.dart';
class dataAPI{

  final String urllink = "api.spoonacular.com";
  static const String API_KEY ="c14712fa2fa34877af487d716778cffd";

  //NOTE : sehari hanya bisa kurleb 150 request saja jdi kalau lebih dri itu ngga isa diakses

  Future<DayPlan> setMealPlan({int targetCalories, String diet}) async{ //nnti setelah data berhasil diambil

      if (diet == 'None'){
        diet ='';
      } 
      Map<String, String> parameters = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': API_KEY,
      };
      Uri uri = Uri.https(urllink,'/recipes/mealplans/generate',parameters,);

      // var apiResult= await http.get(Uri.parse(URLapi));

      // var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      // var data=(jsonObject as Map<String,dynamic>)['data'];
      // return dataAPI.createData(data);
      var apiResult = await http.get(uri);
    
      var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      var data=(jsonObject as Map<String,dynamic>);
      
      DayPlan dayplan = DayPlan.getfood(data);
      return dayplan;  
  }


}


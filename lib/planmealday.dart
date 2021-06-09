import 'dart:io';

import 'package:http/http.dart' as http;
import'dart:convert';
import 'menumeal.dart';
import 'planmealday.dart';

class DayPlan{

  static final String urllink = "api.spoonacular.com";
  static const String API_KEY ="c14712fa2fa34877af487d716778cffd";
  List dayplan;
  double kalori;
  double carb;
  double fat;
  double protein;

  DayPlan({
    this.dayplan,
    this.kalori,
    this.carb,
    this.fat,
    this.protein
  });

  // dataAPI({
  //   this.myid, this.myemail
  // });


  factory DayPlan.getfood(Map<String, dynamic> food) {
    List dayplan = [];
    int angka=0;
    angka=food['meals'].length;
    // print(food);
    // print(food['meals'].length);
    // print("FOOD1");
    // print(food['meals'][0]);

    for(var a=0;a<angka;a++){
      dayplan.add(food['meals'][a]);
    }
    print("DAYPLANN\n");
    print(dayplan);
    // List<Meal> dayplan=[];

    // food['meals'].forEach((mealMap)=> dayplan.add(Meal.getfoodmeal(mealMap)) ) ;
    // print("DAYPLANN");
    // print(dayplan);

    return DayPlan(
    dayplan: dayplan,
    kalori: food['nutrients']['calories'],
    carb: food['nutrients'][' carbohydrates'],
    fat: food['nutrients']['fat'],
    protein: food['nutrients']['protein'],
    );
  }

  static Future<DayPlan> setMealPlan({String targetCalories, String diet}) async{ //nnti setelah data berhasil diambil

      if (diet == 'None'){
        diet ='';
      } 


      String URLapi='https://api.spoonacular.com/recipes/mealplans/generate?timeFrame=day&targetCalories='+targetCalories.toString()+'&diet='+diet+'&apiKey=c14712fa2fa34877af487d716778cffd';
      // Uri uri = Uri.https(urllink,'/recipes/mealplans/generate',parameters,);

      // var apiResult= await http.get(Uri.parse(URLapi));

      // var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      // var data=(jsonObject as Map<String,dynamic>)['data'];
      // return dataAPI.createData(data);

      
      var apiResult = await http.get(Uri.parse(URLapi));
    
      var jsonObject=json.decode(apiResult.body); //buat ambil body dari json
      var data=(jsonObject as Map<String,dynamic>);
      DayPlan dayplan = DayPlan.getfood(data);
      return dayplan; 
    
      
     
      
  }

}



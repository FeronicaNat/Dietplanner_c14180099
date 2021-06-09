import 'package:flutter/material.dart';
import 'package:latflutter4menudiet/mydietmenu.dart';
import 'mylist.dart';
import 'planmealday.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:<String,WidgetBuilder>{
        '/':(context) => MyList(),
        '/MyDietMenu':(context) => MyDietMenu(ModalRoute.of(context).settings.arguments as DayPlan)
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: MyList(),
    );
  }
}


    

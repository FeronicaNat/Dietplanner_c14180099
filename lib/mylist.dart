import 'package:flutter/material.dart';
import 'planmealday.dart';
import 'classAPI.dart';

class MyList extends StatefulWidget {
  // const MyList({ Key? key }) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  String jenisdiet="None";

  double targetCalories = 1000;
  String diet = 'None';

  void searchdayplan() async {
    // DayPlan dayplan = await classAPI.setMealPlan(
    //   targetCalories: targetCalories.toInt(),
    //   diet: diet,
    // );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => MyDietMenu(dayplan: dayplan),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://pbs.twimg.com/media/E27H3QXVgAQ4Uy9?format=jpg&name=large',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 35
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Menu makan dietmu',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(targetCalories.truncate().toString()+" kalori"),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Theme.of(context).primaryColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Colors.lightBlue[100],
                    trackHeight: 6.0,
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 4500.0,
                    value: targetCalories,
                    onChanged: (value) => setState(() {
                      targetCalories = value.round().toDouble();
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem<String>(
                          value: "None", child: Text("None")),
                      DropdownMenuItem<String>(
                          value: "Lacto-Vegetarian", child: Text("Lacto-Vegetarian")),
                      DropdownMenuItem<String>(
                          value: "0vo-Vegetarian", child: Text("0vo-Vegetarian")),
                      DropdownMenuItem<String>(
                          value: "Vegan", child: Text("Vegan")),
                      DropdownMenuItem<String>(
                          value: "Gluten Free", child: Text("Gluten Free")),
                      DropdownMenuItem<String>(
                          value: "Ketogenic", child: Text("Ketogenic")),
                    ],
                    value: jenisdiet,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    hint: Text("Diet"),
                    style: const TextStyle(color: Colors.pink),
                    underline: Container(
                      height: 2,
                      color: Colors.pink,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        jenisdiet = value;
                        print(jenisdiet);
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 8,
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'SEARCH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: searchdayplan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

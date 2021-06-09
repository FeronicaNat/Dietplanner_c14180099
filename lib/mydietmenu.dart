import 'package:flutter/material.dart';
import 'mylist.dart';
import 'planmealday.dart';

class MyDietMenu extends StatefulWidget {
  // const MyDietMenu({ Key? key }) : super(key: key);
  final DayPlan dayplan;
  // _MyButtonState createState() => _MyButtonState(this.textButton,pressButton:pressButton);
  @override
  _MyDietMenuState createState() => _MyDietMenuState();
  MyDietMenu(this.dayplan);
}

class _MyDietMenuState extends State<MyDietMenu> {
  //  final DayPlan dayplan;
  //  _MyDietMenuState({this.dayplan});

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(child: 
        Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink,
                  // offset: Offset(0, 2),
                  // blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total Nutrisi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      // widget.dayplan.dayplan[index]['id']
                      'Kalori: ${widget.dayplan.kalori.toString()} kalori',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Protein: ${widget.dayplan.protein.toString()} g',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Lemak: ${widget.dayplan.fat.toString()} g',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Karbohidrat: ${widget.dayplan.carb.toString()} g',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                height: 500,
                child: new ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: (widget.dayplan != null
                        ? widget.dayplan.dayplan.length
                        : 0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.pink.shade100,
                          child: Column(children: [
                            // Text(
                            // widget.dayplan.dayplan[index]['id'].toString()),
                            Text(
                              (index) == 0 ? "Breakfast" : '',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (index) == 1 ? "Lunch" : '',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (index) == 2 ? "Dinner" : '',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.dayplan.dayplan[index]['title'].toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            // widget.dayplan.dayplan[index]['imageType'].toString()),

                            Image.network(
                              "https://spoonacular.com/recipeImages/" +
                                  widget.dayplan.dayplan[index]['id']
                                      .toString() +
                                  "-636x393." +
                                  widget.dayplan.dayplan[index]['imageType']
                                      .toString(),
                              fit: BoxFit.cover,
                              // width: 200,
                            ),
                          ]));
                    }),
              ))
            ],
          ),

          // Text(((widget.dayplan!=null)?widget.dayplan.kalori.toString():'Kosong')),
          // Text(widget.dayplan.kalori.toString()),
        ],
      ),
    ),
    );

  }
}

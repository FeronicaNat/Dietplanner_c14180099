class DayPlan{
  List<DayPlan> dayplan;
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

  factory DayPlan.getfood(Map<String, dynamic> food) {
    List<DayPlan> dayplan = [];
    food['meals'].forEach((mealMap)=> dayplan.add(DayPlan.getfood(mealMap)) ) ;
    return DayPlan(
    dayplan: dayplan,
    kalori: food['nutrients']['calories'],
    carb: food['nutrients'][' carbohydrates'],
    fat: food['nutrients']['fat'],
    protein: food['nutrients']['protein'],
    );
  }

}
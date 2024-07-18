class MacrosEntity {
  int calories;
  int protein;
  int fat;
  int carbs;

  MacrosEntity({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  Map<String, Object?>  toDocument(){
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    };
  }
  static MacrosEntity fromDocument(Map<String, dynamic> doc){
    return MacrosEntity(
      calories: int.parse(doc['calories'].toString()),
      protein: int.parse(doc['protein'].toString()),
      fat: int.parse(doc['fat'].toString()),
      carbs: int.parse(doc['carbs'].toString()),
      
    );
  }
}
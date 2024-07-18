
import '../model/models.dart';
import 'macros_entity.dart';

class PizzaEntity {
  String pizzaID;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  double price;
  double discount;
  Macros macros;

  PizzaEntity({
    required this.pizzaID,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  }
  );

  Map<String, Object?>  toDocument(){
    return {
      'pizzaID': pizzaID,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toDocument(),
    };
  }
  static PizzaEntity fromDocument(Map<String, dynamic> doc){
    return PizzaEntity(
      pizzaID: doc['pizzaID'],
      picture: doc['picture'],
      isVeg:doc['isVeg'],
      spicy: doc['spicy'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}
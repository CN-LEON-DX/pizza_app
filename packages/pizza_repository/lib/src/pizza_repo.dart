import '../pizza_repository.dart';

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();
  
}
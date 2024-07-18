import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  PizzaRepo _pizzaRepo;
  GetPizzaBloc(this._pizzaRepo) : super(GetPizzaInitial()) {
    on<s>((event, emit) async {
      emit(GetPizzaLoading());
      try{
        List<Pizza> pizzas = await _pizzaRepo.getPizzas();
      } catch(e){
        emit(GetPizzaFailure());
      }
    });
  }
}

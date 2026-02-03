import 'package:flutter_bloc/flutter_bloc.dart';
import 'coffee_event.dart';
import 'coffee_state.dart';
import '../models/coffee.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeInitial()) {
    on<LoadCoffees>(_onLoadCoffees);
    on<FilterByCategory>(_onFilterByCategory);
  }

  void _onLoadCoffees(LoadCoffees event, Emitter<CoffeeState> emit) {
    emit(CoffeeLoading());
    
    // Sample data - in a real app, this would come from an API
    final coffees = [
      Coffee(
        id: '1',
        name: 'Caffe Mocha',
        description: 'Deep foam, espresso, and milk with dark chocolate',
        price: 4.53,
        rating: 4.8,
        imageUrl: 'assets/coffee1.jpg',
        category: 'Cappuccino',
        isFeatured: true,
      ),
      Coffee(
        id: '2',
        name: 'Flat White',
        description: 'Espresso with steamed milk and a layer of microfoam',
        price: 3.53,
        rating: 4.9,
        imageUrl: 'assets/coffee2.jpg',
        category: 'Espresso',
      ),
      Coffee(
        id: '3',
        name: 'Cappuccino',
        description: 'A delicious cappuccino with rich espresso and creamy milk',
        price: 4.20,
        rating: 4.5,
        imageUrl: 'assets/coffee3.jpg',
        category: 'Cappuccino',
      ),
      Coffee(
        id: '4',
        name: 'Latte',
        description: 'Smooth and creamy latte with premium espresso',
        price: 3.80,
        rating: 4.7,
        imageUrl: 'assets/coffee4.jpg',
        category: 'Espresso',
      ),
    ];

    emit(CoffeeLoaded(coffees: coffees));
  }

  void _onFilterByCategory(FilterByCategory event, Emitter<CoffeeState> emit) {
    if (state is CoffeeLoaded) {
      final currentState = state as CoffeeLoaded;
      emit(CoffeeLoaded(
        coffees: currentState.coffees,
        selectedCategory: event.category,
      ));
    }
  }
}

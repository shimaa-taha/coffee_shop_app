import 'package:equatable/equatable.dart';
import '../models/coffee.dart';

abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object?> get props => [];
}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final List<Coffee> coffees;
  final String selectedCategory;

  const CoffeeLoaded({
    required this.coffees,
    this.selectedCategory = 'All',
  });

  List<Coffee> get filteredCoffees {
    if (selectedCategory == 'All') {
      return coffees;
    }
    return coffees.where((c) => c.category == selectedCategory).toList();
  }

  @override
  List<Object?> get props => [coffees, selectedCategory];
}

class CoffeeError extends CoffeeState {
  final String message;

  const CoffeeError(this.message);

  @override
  List<Object?> get props => [message];
}

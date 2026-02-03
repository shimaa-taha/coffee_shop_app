import 'package:equatable/equatable.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object?> get props => [];
}

class LoadCoffees extends CoffeeEvent {}

class FilterByCategory extends CoffeeEvent {
  final String category;

  const FilterByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

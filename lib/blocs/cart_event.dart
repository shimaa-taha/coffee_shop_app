import 'package:equatable/equatable.dart';
import '../models/coffee.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Coffee coffee;
  final String size;
  final int quantity;

  const AddToCart({
    required this.coffee,
    required this.size,
    required this.quantity,
  });

  @override
  List<Object?> get props => [coffee, size, quantity];
}

class RemoveFromCart extends CartEvent {
  final String coffeeId;

  const RemoveFromCart(this.coffeeId);

  @override
  List<Object?> get props => [coffeeId];
}

class UpdateQuantity extends CartEvent {
  final String coffeeId;
  final int quantity;

  const UpdateQuantity(this.coffeeId, this.quantity);

  @override
  List<Object?> get props => [coffeeId, quantity];
}

class ClearCart extends CartEvent {}

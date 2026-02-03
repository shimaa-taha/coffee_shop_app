import 'coffee.dart';

class CartItem {
  final Coffee coffee;
  final String size;
  int quantity;

  CartItem({
    required this.coffee,
    required this.size,
    this.quantity = 1,
  });

  double get totalPrice => coffee.price * quantity;
}

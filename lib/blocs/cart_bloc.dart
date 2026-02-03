import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    
    // Check if item already exists
    final existingIndex = items.indexWhere(
      (item) => item.coffee.id == event.coffee.id && item.size == event.size,
    );

    if (existingIndex != -1) {
      items[existingIndex].quantity += event.quantity;
    } else {
      items.add(CartItem(
        coffee: event.coffee,
        size: event.size,
        quantity: event.quantity,
      ));
    }

    emit(CartState(items: items));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final items = state.items
        .where((item) => item.coffee.id != event.coffeeId)
        .toList();
    emit(CartState(items: items));
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    final items = state.items.map((item) {
      if (item.coffee.id == event.coffeeId) {
        item.quantity = event.quantity;
      }
      return item;
    }).toList();
    emit(CartState(items: items));
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartState(items: []));
  }
}

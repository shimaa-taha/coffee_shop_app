import 'package:equatable/equatable.dart';
import '../models/coffee.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class AddToFavorites extends FavoriteEvent {
  final Coffee coffee;

  const AddToFavorites(this.coffee);

  @override
  List<Object?> get props => [coffee];
}

class RemoveFromFavorites extends FavoriteEvent {
  final String coffeeId;

  const RemoveFromFavorites(this.coffeeId);

  @override
  List<Object?> get props => [coffeeId];
}

class ToggleFavorite extends FavoriteEvent {
  final Coffee coffee;

  const ToggleFavorite(this.coffee);

  @override
  List<Object?> get props => [coffee];
}

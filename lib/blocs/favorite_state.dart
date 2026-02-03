import 'package:equatable/equatable.dart';
import '../models/coffee.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Coffee> favorites;

  const FavoriteLoaded({required this.favorites});

  bool isFavorite(String coffeeId) {
    return favorites.any((coffee) => coffee.id == coffeeId);
  }

  @override
  List<Object?> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}

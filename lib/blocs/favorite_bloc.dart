import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import '../models/coffee.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onLoadFavorites(LoadFavorites event, Emitter<FavoriteState> emit) {
    emit(FavoriteLoading());
    // In a real app, load from local storage or API
    emit(const FavoriteLoaded(favorites: []));
  }

  void _onAddToFavorites(AddToFavorites event, Emitter<FavoriteState> emit) {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final favorites = List<Coffee>.from(currentState.favorites);
      
      // Check if already exists
      if (!favorites.any((coffee) => coffee.id == event.coffee.id)) {
        favorites.add(event.coffee);
        emit(FavoriteLoaded(favorites: favorites));
      }
    }
  }

  void _onRemoveFromFavorites(
      RemoveFromFavorites event, Emitter<FavoriteState> emit) {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final favorites = currentState.favorites
          .where((coffee) => coffee.id != event.coffeeId)
          .toList();
      emit(FavoriteLoaded(favorites: favorites));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<FavoriteState> emit) {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final favorites = List<Coffee>.from(currentState.favorites);
      
      final index = favorites.indexWhere((coffee) => coffee.id == event.coffee.id);
      
      if (index != -1) {
        // Remove if exists
        favorites.removeAt(index);
      } else {
        // Add if doesn't exist
        favorites.add(event.coffee);
      }
      
      emit(FavoriteLoaded(favorites: favorites));
    }
  }
}

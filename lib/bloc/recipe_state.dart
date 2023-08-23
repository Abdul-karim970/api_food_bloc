part of 'recipe_bloc.dart';

@immutable
sealed class RecipeState {}

final class RecipeInitialState extends RecipeState {}

final class RecipeLoadingState extends RecipeState {}

final class RecipeLoadedState extends RecipeState {
  final List<Recipes> recipes;
  RecipeLoadedState({required this.recipes});
}

final class RecipeErrorState extends RecipeState {
  final String error;
  RecipeErrorState({required this.error});
}

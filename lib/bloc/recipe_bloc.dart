import 'package:api_food/API/recipe_api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/recipies.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeFetchEvent, RecipeState> {
  RecipesProvider recipesProvider = RecipesProvider();

  RecipeBloc() : super(RecipeInitialState()) {
    on<RecipeFetchEvent>((event, emit) async {
      emit(RecipeLoadingState());
      try {
        var recipes = await recipesProvider.fetchRecipes();
        emit(RecipeLoadedState(recipes: recipes));
      } catch (e) {
        emit(RecipeErrorState(error: 'Na Ustaad'));
      }
    });
  }
}

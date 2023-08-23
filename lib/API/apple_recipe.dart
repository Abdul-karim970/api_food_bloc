import 'package:api_food/models/apple_recipe_results_model.dart';
import 'package:api_food/models/apple_recipe_search_result_model.dart';

class AppleRecipe {
  List<AppleRecipeSearchResults> appleRecipeSearchResultsList;
  List<AppleRecipeResults> appleRecipeResultsList;
  AppleRecipe(
      {required this.appleRecipeResultsList,
      required this.appleRecipeSearchResultsList});
}

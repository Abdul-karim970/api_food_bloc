import 'package:api_food/apple_recipe_result_riverpod/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../API/apple_recipe_search_result_provider.dart';
import '../models/apple_recipe_results_model.dart';

class AppleRecipeResultStateNotifier
    extends StateNotifier<AppleRecipeResultState> {
  AppleRecipeResultStateNotifier() : super(AppleRecipeResultsInitialState());
  AppleRecipeResultProvider appleRecipeResultProvider =
      AppleRecipeResultProvider();

  fetchAppleRecipeResults() async {
    Future(() => state = AppleRecipeResultsLoadingState());
    List<AppleRecipeResults> appleRecipeResultList =
        await appleRecipeResultProvider.fetchAppleRecipeResults();
    state = AppleRecipeResultsLoadedState(
        appleRecipeResults: appleRecipeResultList);
  }
}

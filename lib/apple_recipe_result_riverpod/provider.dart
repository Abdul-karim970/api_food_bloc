import 'package:api_food/apple_recipe_result_riverpod/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'apple_recipe_result_state_notifier.dart';

final appleRecipeResultProvider = StateNotifierProvider<
    AppleRecipeResultStateNotifier, AppleRecipeResultState>((ref) {
  return AppleRecipeResultStateNotifier();
});

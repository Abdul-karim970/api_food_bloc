import 'package:api_food/models/apple_recipe_results_model.dart';

sealed class AppleRecipeResultState {}

class AppleRecipeResultsInitialState extends AppleRecipeResultState {}

class AppleRecipeResultsLoadingState extends AppleRecipeResultState {}

class AppleRecipeResultsLoadedState extends AppleRecipeResultState {
  final List<AppleRecipeResults> appleRecipeResults;
  AppleRecipeResultsLoadedState({required this.appleRecipeResults});
}

class AppleRecipeResultsErrorState extends AppleRecipeResultState {
  final String error;
  AppleRecipeResultsErrorState({required this.error});
}

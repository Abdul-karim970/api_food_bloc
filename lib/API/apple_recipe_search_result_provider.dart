import 'package:api_food/API/api_provider.dart';
import '../models/apple_recipe_results_model.dart';
import '../models/apple_recipe_search_result_model.dart';

class AppleRecipeSearchResultProvider extends ApiProvider {
  @override
  String get apiUrl =>
      'food/search?apiKey=50e281b0f50e4478b96df542fe2d7c36&query=apple';

  Future<List<AppleRecipeSearchResults>> fetchAppleRecipeSearchResults() async {
    Map<String, dynamic> appleRecipeMap = await fetch();
    List appleSearchResultsMapList = appleRecipeMap['searchResults'];
    List<AppleRecipeSearchResults> appleRecipeSearchResultsList =
        appleSearchResultsMapList.map((searchResultMap) {
      return AppleRecipeSearchResults.fromMap(searchResultMap);
    }).toList();

    return appleRecipeSearchResultsList;
  }
}

class AppleRecipeResultProvider extends ApiProvider {
  @override
  String get apiUrl =>
      'food/search?apiKey=50e281b0f50e4478b96df542fe2d7c36&query=apple';

  Future<List<AppleRecipeResults>> fetchAppleRecipeResults() async {
    Map<String, dynamic> appleRecipeMap = await fetch();
    List appleSearchResultsMapList = appleRecipeMap['searchResults'];
    List<AppleRecipeResults> resultsList = [];
    for (var map in appleSearchResultsMapList) {
      List list = map['results'];
      resultsList
          .addAll(list.map((map) => AppleRecipeResults.fromMap(map)).toList());
    }

    return resultsList;
  }
}

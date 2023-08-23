import '../models/recipies.dart';
import 'api_provider.dart';

class RecipesProvider extends ApiProvider {
  @override
  String get apiUrl =>
      'recipes/complexSearch?apiKey=50e281b0f50e4478b96df542fe2d7c36&query=italian';
  static const resultantMapResults = 'results';
  static const resultantMapOffset = 'offset';
  static const resultantMapNumbers = 'numbers';
  static const resultantMapTotalResults = 'totalResults';

  Future<List<Recipes>> fetchRecipes() async {
    Map<String, dynamic> recipesMapList = await fetch();
    List mapList = recipesMapList[resultantMapResults];
    List<Recipes> recipesList =
        mapList.map((map) => Recipes.fromMap(map)).toList();
    return recipesList;
  }
}

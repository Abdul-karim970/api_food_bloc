import 'package:api_food/API/apple_recipe_provider.dart';
import 'package:api_food/pages/recip_apple_result_page.dart';
import 'package:flutter/material.dart';
import '../models/apple_recipe_search_result_model.dart';

class RecipeApplePage extends StatefulWidget {
  const RecipeApplePage({super.key, required this.title});

  final String title;

  @override
  State<RecipeApplePage> createState() => _RecipeApplePageState();
}

class _RecipeApplePageState extends State<RecipeApplePage> {
  late AppleRecipeSearchResultProvider _appleRecipeSearchResults;
  List<AppleRecipeSearchResults> _appleSearchResultList = List.empty();

  @override
  void initState() {
    super.initState();
    _appleRecipeSearchResults = AppleRecipeSearchResultProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RecipeAppleResultPage(title: 'Result'),
                  )),
              icon: const Icon(Icons.navigate_next_rounded))
        ],
      ),
      body: Center(
          child: FutureBuilder(
        future: _appleRecipeSearchResults.fetchAppleRecipeSearchResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            try {
              _appleSearchResultList = snapshot.data!;
              return LoadedStateWidget(
                  searchResultsList: _appleSearchResultList);
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
              return const CircularProgressIndicator();
            }
          }
        },
      )),
    );
  }
}

class LoadedStateWidget extends StatelessWidget {
  const LoadedStateWidget({super.key, required this.searchResultsList});
  final List<AppleRecipeSearchResults> searchResultsList;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        itemExtent: 70,
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: searchResultsList.length, (context, index) {
          var searchResult = searchResultsList[index];
          return AppleRecipeListTile(
            name: searchResult.name,
            totalProducts: searchResult.totalResults,
          );
        }));
  }
}

class AppleRecipeListTile extends ListTile {
  AppleRecipeListTile(
      {super.key, required String name, required int totalProducts})
      : super(title: Text(name), leading: Text(totalProducts.toString()));
}

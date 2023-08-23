import 'package:api_food/API/apple_recipe_search_result_provider.dart';
import 'package:api_food/pages/malbex_page.dart';
import 'package:flutter/material.dart';
import '../models/apple_recipe_results_model.dart';

class RecipeAppleResultPage extends StatefulWidget {
  const RecipeAppleResultPage({super.key, required this.title});

  final String title;

  @override
  State<RecipeAppleResultPage> createState() => _RecipeAppleResultPageState();
}

class _RecipeAppleResultPageState extends State<RecipeAppleResultPage> {
  late AppleRecipeResultProvider _appleRecipeResults;
  List<AppleRecipeResults> _appleSearchResultList = List.empty();

  @override
  void initState() {
    super.initState();
    _appleRecipeResults = AppleRecipeResultProvider();
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
                    builder: (context) => const Malbec(),
                  )),
              icon: const Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
          child: FutureBuilder(
        future: _appleRecipeResults.fetchAppleRecipeResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            try {
              _appleSearchResultList = snapshot.data!;
              print(_appleSearchResultList.length);
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
  final List<AppleRecipeResults> searchResultsList;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        itemExtent: 70,
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: searchResultsList.length, (context, index) {
          var searchResult = searchResultsList[index];
          return AppleRecipeListTile(
            name: searchResult.name ?? '',
            totalProducts: searchResult.id ?? 0,
          );
        }));
  }
}

class AppleRecipeListTile extends ListTile {
  AppleRecipeListTile(
      {super.key, required String name, required int totalProducts})
      : super(title: Text(name), leading: Text(totalProducts.toString()));
}

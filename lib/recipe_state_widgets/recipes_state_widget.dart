import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/recipies.dart';

class RecipeInitialStateWidget extends StatelessWidget {
  const RecipeInitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('No Recipe yet!!');
  }
}

class RecipeLoadingWidget extends StatelessWidget {
  const RecipeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class RecipeLoadedStateWidget extends StatelessWidget {
  const RecipeLoadedStateWidget({super.key, required this.recipes});
  final List<Recipes> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        itemExtent: 70,
        childrenDelegate: SliverChildBuilderDelegate(childCount: recipes.length,
            (context, index) {
          var recipe = recipes[index];
          return RecipeListTile(
            title: recipe.title,
            id: recipe.id,
          );
        }));
  }
}

class RecipeListTile extends ListTile {
  RecipeListTile({super.key, required String title, required int id})
      : super(title: Text(title), leading: Text(id.toString()));
}

class RecipeErrorStateWidget extends StatelessWidget {
  const RecipeErrorStateWidget({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}

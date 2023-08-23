import 'package:api_food/pages/recipes_apple_page.dart';
import 'package:flutter/material.dart';

import '../API/recipe_api_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _recipesProvider = RecipesProvider();
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
                        const RecipeApplePage(title: 'Apple Recipe'),
                  )),
              icon: const Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
          child: FutureBuilder(
        future: _recipesProvider.fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var snapshotData = snapshot.data!;
            return ListView.builder(
              itemCount: snapshotData.length,
              itemBuilder: (context, index) {
                var itemData = snapshotData[index];
                return ListTile(
                  title: Text(
                    itemData.title,
                  ),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(itemData.image)),
                  trailing: Text(itemData.imageType),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}

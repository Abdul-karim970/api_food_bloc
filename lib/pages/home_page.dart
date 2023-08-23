import 'package:api_food/pages/recipes_apple_page.dart';
import 'package:api_food/recipe_state_widgets/recipes_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/recipe_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RecipeBloc recipeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recipeBloc = context.read<RecipeBloc>();
    recipeBloc.add(RecipeFetchEvent());
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
                        const RecipeApplePage(title: 'Apple Recipe'),
                  )),
              icon: const Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
          child: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: recipeBloc,
        builder: (context, state) {
          if (state is RecipeInitialState) {
            return const RecipeInitialStateWidget();
          } else if (state is RecipeLoadingState) {
            return const RecipeLoadingWidget();
          } else if (state is RecipeLoadedState) {
            return RecipeLoadedStateWidget(recipes: state.recipes);
          } else {
            return RecipeErrorStateWidget(
                error: (state as RecipeErrorState).error);
          }
        },
      )),
    );
  }
}

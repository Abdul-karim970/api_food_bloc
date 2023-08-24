import 'package:api_food/apple_recipe_result_riverpod/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../apple_recipe_result_riverpod/states.dart';
import '../models/apple_recipe_results_model.dart';

class AppleRecipeResult extends ConsumerStatefulWidget {
  const AppleRecipeResult({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppleRecipeResultState();
}

class _AppleRecipeResultState extends ConsumerState<AppleRecipeResult> {
  @override
  Widget build(BuildContext context) {
    ref.read(appleRecipeResultProvider.notifier).fetchAppleRecipeResults();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            var state = ref.watch(appleRecipeResultProvider);
            if (state is AppleRecipeResultsInitialState) {
              return Text('initial');
            } else if (state is AppleRecipeResultsLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is AppleRecipeResultsLoadedState) {
              return AppleRecipeLoadedStateWidget(
                  appleRecipeResultsList: state.appleRecipeResults);
            } else {
              return Text((state as AppleRecipeResultsErrorState).error);
            }
          },
        ),
      ),
    );
  }
}

class AppleRecipeLoadedStateWidget extends StatelessWidget {
  const AppleRecipeLoadedStateWidget(
      {super.key, required this.appleRecipeResultsList});
  final List<AppleRecipeResults> appleRecipeResultsList;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        itemExtent: 70,
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: appleRecipeResultsList.length, (context, index) {
          var searchResult = appleRecipeResultsList[index];
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

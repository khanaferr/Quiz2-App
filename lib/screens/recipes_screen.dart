import 'package:flutter/material.dart';
import '../widgets/recipe_item.dart';
import '../data/recipes.dart';

class RecipesScreen extends StatelessWidget {
  final void Function(int, String) onSelectRating;
  final Function() onSubmit;

  const RecipesScreen({
    super.key,
    required this.onSelectRating,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ...recipes.asMap().entries.map((entry) {
            int index = entry.key;
            var recipe = entry.value;

            return RecipeItem(
              recipe: recipe,
              index: index,
              onSelectRating: onSelectRating,
            );
          }),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 73, 168, 122),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

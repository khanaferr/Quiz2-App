import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen"; //

  List<String> selectedRatings = List.filled(recipes.length, "");

  String topRecipeName() {
    int bestValue = -1;
    String bestName = "None";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > bestValue) {
          bestValue = value;
          bestName = recipes[i].recipeName;
        }
      }
    }
    return bestName;
  } //

  double get averageRating {
    int total = 0;
    int count = 0;
    for (var rating in selectedRatings) {
      if (rating.isNotEmpty) {
        total += emojiToValue[rating]!;
        count++;
      }
    }
    if (count == 0) return 0.0;
    return total / count;
  }

  void _selectRating(int index, String rating) {
    setState(() {
      selectedRatings[index] = rating;
    });
  }

  void _submit() {
    setState(() {
      currentScreen = "result-screen";
    });
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen"; //
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (currentScreen == "recipes-screen") {
      screenWidget = RecipesScreen(
        onSelectRating: _selectRating,
        onSubmit: _submit,
      );
    } else {
      screenWidget = ResultScreen(
        averageRating: averageRating,
        topRecipeName: topRecipeName(),
        onRestart: _restart,
      );
    }

    return Scaffold(
      body: SafeArea(child: screenWidget),
      backgroundColor: const Color.fromARGB(255, 73, 168, 122), //
    );
  }
}

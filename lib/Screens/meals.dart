import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.updateFavoriteScreen});

  final void Function() updateFavoriteScreen;
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meals.isEmpty) {
      content = Center(
        child: Text(
          "Uh Oh..., No meals here!",
          style: GoogleFonts.aBeeZee(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      content = ListView(
        children: [for (Meal m in meals) MealItem(meal: m, updateFavoriteScreen: updateFavoriteScreen,)],
      );
    }

    if (title == null)
    {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}

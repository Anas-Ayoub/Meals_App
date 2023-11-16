import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widgets/meal_details_appbar.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal, required this.updateFavoriteScreen});
  final void Function() updateFavoriteScreen;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MealDetailsAppBar(meal: meal, updateFavoriteScreen: updateFavoriteScreen,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              
              tag: meal.id,
              child: Image(
                image: NetworkImage(meal.imageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  step,
                  style: GoogleFonts.abel(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/category.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.updateFavoriteScreen, required this.availableMeals});
  final void Function() updateFavoriteScreen;
  final List<Meal> availableMeals;
  final Category category;

  onSelectCategory(BuildContext context) {

    List<Meal> mealsWithCategoryC3 = availableMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: mealsWithCategoryC3, updateFavoriteScreen: updateFavoriteScreen,),),);
    //MealsScreen(title: category.title, meals: mealsWithCategoryC3);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onSelectCategory(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

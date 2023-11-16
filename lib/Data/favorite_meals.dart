//import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

List<Meal> favoriteMeals = [];

addMeal(Meal m)
{
  favoriteMeals.add(m);
}

removeMeal(Meal m)
{
  favoriteMeals.remove(m);
}
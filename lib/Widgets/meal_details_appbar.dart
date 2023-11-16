import 'package:flutter/material.dart';
import 'package:meals_app/Data/favorite_meals.dart';
import 'package:meals_app/Models/meal.dart';

var icon = Icons.star_border;

class MealDetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MealDetailsAppBar(
      {super.key, required this.meal, required this.updateFavoriteScreen});
  final void Function() updateFavoriteScreen;
  final Meal meal;

  @override
  _MealDetailsAppBarState createState() => _MealDetailsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MealDetailsAppBarState extends State<MealDetailsAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: 0,
      upperBound: 1,
    );
    super.initState();

    //_animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  var icon = Icons.star_border;

  void showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  void toggleFavoriteMeal() {
    setState(() {
      _animController.reset();
      _animController.forward();

      if (favoriteMeals.contains(widget.meal)) {
        favoriteMeals.remove(widget.meal);
        icon = Icons.star_border;
        showInfoMessage("Meal removed from Favorite");
      } else {
        favoriteMeals.add(widget.meal);
        icon = Icons.star;
        showInfoMessage("Meal added to Favorite!");
      }
      widget.updateFavoriteScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.contains(widget.meal)) {
      icon = Icons.star;
    }

    return AppBar(
      actions: [
        AnimatedBuilder(
          animation: _animController,
          child: IconButton(
            onPressed: toggleFavoriteMeal,
            highlightColor: Colors.transparent,
            icon: Icon(icon),
          ),
          builder: (context, child) => RotationTransition(
            turns: Tween(begin: 0.6, end: 1.0).animate(
              CurvedAnimation(parent: _animController, curve: Curves.easeOut),
            ),
            child: child,
          ),
        ),
      ],
      title: Text(
        widget.meal.title,
      ),
    );
  }
}

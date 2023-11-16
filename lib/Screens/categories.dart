import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      required this.updateFavoriteScreen,
      required this.availableMeals});

  final void Function() updateFavoriteScreen;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0,
      upperBound: 1,
    );
    super.initState();

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          children: [
            for (final cat in availableCategories)
              CategoryGridItem(
                category: cat,
                updateFavoriteScreen: widget.updateFavoriteScreen,
                availableMeals: widget.availableMeals,
              )
          ],
        ),
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animController,
            curve: Curves.bounceOut,
          ),
        ),
        child: child,
      ),
    );
  }
}

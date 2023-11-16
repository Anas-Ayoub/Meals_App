import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Data/favorite_meals.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filters.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Meal> meals = favoriteMeals;
  //final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void updateFavoriteScreen() {
    setState(() {
      meals = favoriteMeals;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      updateFavoriteScreen: updateFavoriteScreen,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: meals,
        updateFavoriteScreen: updateFavoriteScreen,
      );
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 20,
        centerTitle: true,
        
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}

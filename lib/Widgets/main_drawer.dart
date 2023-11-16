import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final Function(String id) onSelectScreen;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "Coocking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                  ),
            ),
            onTap: () {onSelectScreen("meals");},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                  ),
            ),
            onTap: () {onSelectScreen("filters");},
          ),
        ],
      ),
    );
  }
}

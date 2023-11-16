import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/meal_details.dart';
import 'package:meals_app/Widgets/meal_item_treat.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.updateFavoriteScreen});
  final void Function() updateFavoriteScreen;
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  onSelectMeal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(meal: meal, updateFavoriteScreen: updateFavoriteScreen,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () { onSelectMeal(context); },
      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

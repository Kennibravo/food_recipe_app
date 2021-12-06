import 'package:flutter/material.dart';
import 'package:food_recipe_app/providers/meal_category.dart';
import 'package:food_recipe_app/screens/drawer_screen.dart';
import 'package:food_recipe_app/screens/intro_screen.dart';
import 'package:food_recipe_app/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          DrawerScreen(),
          IntroScreen(),
        ],
      ),
    );
  }
}

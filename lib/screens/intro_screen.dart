import 'package:flutter/material.dart';
import 'package:food_recipe_app/providers/drawer_provider.dart';
import 'package:food_recipe_app/screens/details_screen.dart';
import 'package:food_recipe_app/widgets/intro_main_item.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DrawerProvider>(context);

    return Stack(
      children: [
        provider.currentStack == CURRENT_STACK.intro
            ? GestureDetector(
                onTap: () {
                  provider.closeDrawer();
                  provider.displayingDetails();
                },
                child: DetailsScreen(context),
              )
            : GestureDetector(
                onTap: () {
                  provider.closeDrawer();
                  provider.displayingIntro();
                },
                child: IntroMainItem(provider),
              ),
        provider.currentStack == CURRENT_STACK.details
            ? GestureDetector(
                onTap: () {
                  provider.closeDrawer();
                  provider.displayingDetails();
                },
                child: DetailsScreen(context),
              )
            : GestureDetector(
                onTap: () {
                  provider.closeDrawer();
                  provider.displayingIntro();
                },
                child: IntroMainItem(provider),
              ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe_app/providers/meal_category.dart';
import 'package:food_recipe_app/widgets/category_item.dart';
import 'package:food_recipe_app/widgets/popular_food.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var xOffset = 0.0;
  var yOffset = 0.0;
  var scaleFactor = 1.0;
  var drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          openDrawer(mediaQuery);
        });
        
        return false;
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.only(
            top: mediaQuery.padding.top, bottom: mediaQuery.padding.bottom),
        color: Colors.white,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              if (drawerOpen) {
                setState(() {
                  closeDrawer();
                });
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    drawerOpen
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                closeDrawer();
                              });
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.angleLeft,
                              size: 20,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                openDrawer(mediaQuery);
                              });
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.bars,
                              size: 15,
                            ),
                          ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.search,
                        size: 15,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipex Food Recipes',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'Healthy and nutritious food recipes',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const CategoryItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openDrawer(MediaQueryData mediaQuery) {
    xOffset = mediaQuery.size.width * 0.5;
    yOffset = mediaQuery.size.height / 5;
    scaleFactor = 0.6;
    drawerOpen = true;
  }

  void closeDrawer() {
    xOffset = 0.0;
    yOffset = 0.0;
    scaleFactor = 1.0;
    drawerOpen = false;
  }
}

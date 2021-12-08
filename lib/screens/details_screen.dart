import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe_app/providers/drawer_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.prevContext, {Key? key}) : super(key: key);

  BuildContext? prevContext;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DrawerProvider>(widget.prevContext!);

    final mediaQuery = MediaQuery.of(widget.prevContext!);

    return AnimatedContainer(
      transform: Matrix4.translationValues(
        double.parse(provider.detailsScreen['xOffset'].toString()),
        double.parse(provider.detailsScreen['yOffset'].toString()),
        0,
      )..scale(
          double.parse(provider.detailsScreen['scaleFactor'].toString()),
        ),
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.only(
          top: mediaQuery.padding.top, bottom: mediaQuery.padding.bottom),
      color: Colors.white.withOpacity(
        provider.currentStack == CURRENT_STACK.details ? 1 : 0.5,
      ),
      child: GestureDetector(
        onTap: () {
          provider.closeDrawer();
          provider.displayingDetails();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.introScreen['drawerOpen'] as bool
                    ? IconButton(
                        onPressed: () {
                          provider.closeDrawer();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleLeft,
                          size: 20,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          provider.openDrawer(mediaQuery);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleLeft,
                          size: 22,
                        ),
                      ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.heart,
                    size: 20,
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
          ],
        ),
      ),
    );
  }
}

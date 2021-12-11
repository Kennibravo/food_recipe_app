import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe_app/models/categories.dart';
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

    final currentCategory = provider.getCurrentCategoryDetails();

    final mediaQuery = MediaQuery.of(widget.prevContext!);

    return Builder(builder: (context) {
      if (provider.currentCategoryId.isEmpty) {
        return Container();
      }

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
        child: SingleChildScrollView(
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
                      currentCategory['strCategory']!,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentCategory['strShortDescription']!,
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nutritions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              FoodInfoPill(currentCategory: currentCategory),
                              const SizedBox(height: 15),
                              FoodInfoPill(currentCategory: currentCategory),
                              const SizedBox(height: 15),
                              FoodInfoPill(currentCategory: currentCategory)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200]!,
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                width: 200,
                                height: 210,
                                fit: BoxFit.fill,
                                imageUrl:
                                    currentCategory['strCategoryThumb']!,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'consectetur adipiscing elit',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'sed do eiusmod tempor incididunt',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'laudantium, totam rem aperiam',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'voluptate velit esse quam nihil',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'odio dignissimos ducimus qui',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Recipe Preparation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(height: 5),
                        Text(
                          '''At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio
                        ''',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      );
    });
  }
}

class FoodInfoPill extends StatelessWidget {
  const FoodInfoPill({
    Key? key,
    required this.currentCategory,
  }) : super(key: key);

  final Map<String, String> currentCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      currentCategory['calories']!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Column(
                  children: const [
                    Text(
                      'Calories',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kcal',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

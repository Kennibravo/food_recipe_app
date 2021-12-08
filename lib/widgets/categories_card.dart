import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/categories.dart';
import 'package:food_recipe_app/widgets/popular_food.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (ctx, index) => Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 290,
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.only(top: 70, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              blurRadius: 15,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: categories[index]['strCategoryThumb']!,
                          width: 220,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 170,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  categories[index]['strCategory']!,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 210,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Center(
                              child: Text(
                                categories[index]['strShortDescription']!,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 280,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${categories[index]['calories']!} Kcal",
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 62,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff416d6d),
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.favorite_border_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const PopularFood()
      ],
    );
  }
}

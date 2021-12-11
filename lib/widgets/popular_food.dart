import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Popolar', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(width: 5),
            Text(
              'Food',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: const Color(0xff416d6d),
                  ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://www.themealdb.com/images/category/lamb.png',
                    width: 240,
                    height: 200,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Column(
                        children: [
                          FittedBox(
                            child: Text(
                              'Lamb Meat',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Spicy with Garlic'),
                          const SizedBox(height: 13),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '150 Kcal',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff416d6d),
                                  foregroundColor: Colors.white,
                                  child: Icon(Icons.favorite_border_outlined),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

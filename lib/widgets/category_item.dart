import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe_app/widgets/categories_card.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  var isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = 1;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                        color: isSelected == 1 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350]!,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.utensilSpoon,
                          color: isSelected != 1 ? Colors.black : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Vegetables',
                          style: TextStyle(
                            color:
                                isSelected != 1 ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                      color: isSelected == 2 ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[350]!,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.food_bank_outlined,
                        color: isSelected != 2 ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Beef',
                        style: TextStyle(
                          color: isSelected != 2 ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = 3;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                        color: isSelected == 3 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350]!,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.utensils,
                          color: isSelected != 3 ? Colors.black : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Seafood',
                          style: TextStyle(
                            color:
                                isSelected != 3 ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CategoriesCard()
        ],
      ),
    );
  }
}

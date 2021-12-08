import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipe_app/providers/drawer_provider.dart';
import 'package:food_recipe_app/widgets/category_item.dart';
import 'package:provider/provider.dart';

class IntroMainItem extends StatefulWidget {
  IntroMainItem(this.provider, {Key? key}) : super(key: key);

  DrawerProvider provider;

  @override
  _IntroMainItemState createState() => _IntroMainItemState();
}

class _IntroMainItemState extends State<IntroMainItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        widget.provider.openDrawer(mediaQuery);

        return false;
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(
          double.parse(widget.provider.introScreen['xOffset'].toString()),
          double.parse(widget.provider.introScreen['yOffset'].toString()),
          0,
        )..scale(
            double.parse(widget.provider.introScreen['scaleFactor'].toString()),
          ),
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.only(
            top: mediaQuery.padding.top, bottom: mediaQuery.padding.bottom),
        color: Colors.white,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              widget.provider.closeDrawer();
              widget.provider.displayingIntro();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.provider.introScreen['drawerOpen'] as bool
                        ? IconButton(
                            onPressed: () {
                              widget.provider.closeDrawer();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.angleLeft,
                              size: 20,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              widget.provider.openDrawer(mediaQuery);
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
                ElevatedButton(
                  onPressed: () {
                    widget.provider.displayingDetails();
                  },
                  child: Text('Change display'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

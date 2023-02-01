import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/item_card/itemcard.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class skinInfectFlower_Category extends StatefulWidget {
  @override
  State<skinInfectFlower_Category> createState() => _MyWidgetState();
}

// ignore: non_constant_identifier_names
List<Herbal> flowerSkinInfect = List.from(skinInfectFlower);

class _MyWidgetState extends State<skinInfectFlower_Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.builder(
                itemCount: flowerSkinInfect.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) => ItemCard(
                  isWishlist: true,
                  herbalList: flowerSkinInfect[index],
                  press: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          pageBuilder:
                              ((context, animation, secondaryAnimation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: Itemheader(
                                        herbalList: flowerSkinInfect[index]),
                                  )))),
                ),
              ),
            ),
          )
        ]);
  }
}

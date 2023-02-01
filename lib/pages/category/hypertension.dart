import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/item_card/itemcard.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class hypertension_Category extends StatefulWidget {


  @override
  State<hypertension_Category> createState() => _MyWidgetState();
}

// ignore: non_constant_identifier_names
List<Herbal> display_Hypertension = List.from(filteredHypertension);
class _MyWidgetState extends State<hypertension_Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GridView.builder(
              itemCount: display_Hypertension.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) => ItemCard(
                        isWishlist: true,
                        herbalList:  display_Hypertension[index],
                        press: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              reverseTransitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: ((context, animation, secondaryAnimation) => 
                              FadeTransition(
                                opacity: animation,
                                child: Itemheader(herbalList: display_Hypertension[index]),
                              )
                              ))
                            // MaterialPageRoute(
                            //     builder: (context) => Itemheader(
                            //           herbalList:  display_list[index],
                            //         ))
                                    ),),
            ),
          ),
        )]);
  }
}

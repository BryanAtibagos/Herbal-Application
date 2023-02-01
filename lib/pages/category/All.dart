// ignore_for_file: file_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/item_card/itemcard.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';


class All_Category extends StatefulWidget {


  @override
  State<All_Category> createState() => _MyWidgetState();
}

// ignore: non_constant_identifier_names
List<Herbal> display_list = List.from(listplants);
class _MyWidgetState extends State<All_Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: listplants.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) => ItemCard(
                        isWishlist: true,
                        herbalList:  listplants[index],
                        press: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              reverseTransitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: ((context, animation, secondaryAnimation) => 
                              FadeTransition(
                                opacity: animation,
                                child: Itemheader(herbalList: listplants[index]),
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

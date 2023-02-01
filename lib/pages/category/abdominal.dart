import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/item_card/itemcard.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class abdominal_Category extends StatefulWidget {


  @override
  State<abdominal_Category> createState() => _MyWidgetState();
}

// ignore: non_constant_identifier_names
List<Herbal> display_abdominal = List.from(filteredAbdominal);
class _MyWidgetState extends State<abdominal_Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GridView.builder(
              itemCount: display_abdominal.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) => ItemCard(
                        isWishlist: true,
                        herbalList:  display_abdominal[index],
                        press: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              reverseTransitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: ((context, animation, secondaryAnimation) => 
                              FadeTransition(
                                opacity: animation,
                                child: Itemheader(herbalList: display_abdominal[index]),
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

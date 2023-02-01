// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/item_card/favcard.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritesState createState() => _FavoritesState();
}

//hex color
hexColor(String colorhercode) {
  // ignore: prefer_interpolation_to_compose_strings
  String colornew = '0xff' + colorhercode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}
//end hex

class _FavoritesState extends State<Favorites> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'My ',
                style: TextStyle(
                    fontSize: 26, fontFamily: 'Segoe UI', color: Colors.black),
              ),
              const Text(
                'Favorites',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Segoe UI',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        // actions: [
        //   BlocBuilder<WishlistBloc, WishlistState>(
        //     builder: (context, state) {
        //       if (state is WishlistLoading) {
        //         return Center(
        //           child: Image.asset(
        //             'assets/UI/loader.gif',
        //             width: 150,
        //           ),
        //         );
        //       }
        //       if (state is WishlistLoaded) {
        //         return IconButton(
        //             onPressed: () async {
        //               final invoice = Invoice(items: [
        //                 InvoiceItem(
        //                   name: state.wishlist.herbalList.toString()),
        //               ]);

        //               final pdfFile = await PdfInvoiceApi.generate(invoice);

        //               // opening the pdf file
        //               PdfApi.openFile(pdfFile);
        //             },
        //             icon: Icon(Icons.save));
        //       } else {
        //         return Text('Something went wrong');
        //       }
        //     },
        //   )
        // ],
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Item',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Segoe UI",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //End Item title
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                if (state is WishlistLoading) {
                  return Center(
                    child: Image.asset(
                      'assets/UI/loader.gif',
                      width: 150,
                    ),
                  );
                }
                if (state is WishlistLoaded) {
                    var sortFav = state.wishlist.herbalList..sort((a, b) => a.name.compareTo(b.name));
                  return ListView.builder(
                      itemCount: sortFav.length,
                      itemBuilder: (context, index) => FavCard(
                          herbalList: sortFav[index],
                          press: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 400),
                              reverseTransitionDuration: const Duration(milliseconds: 400),
                              pageBuilder: ((context, animation, secondaryAnimation) => 
                              FadeTransition(
                                opacity: animation,
                                child: Itemheader(herbalList: sortFav[index]),
                              )
                              )))));
                } else {
                  return Text('Something went wrong');
                }
              }),
            ),
          )
        ]),
      ),
    );
  }
}

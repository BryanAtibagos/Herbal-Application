import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/model/herbals.dart';

//hex color
hexColor(String colorhercode) {
  // ignore: prefer_interpolation_to_compose_strings
  String colornew = '0xff' + colorhercode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}
//end hex

class FavCard extends StatelessWidget {
  final Herbal herbalList;
  // ignore: prefer_typing_uninitialized_variables
  final press;
  const FavCard({
    Key? key,
    required this.herbalList,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(hexColor('#BFD8C4')),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Hero(
                            tag: herbalList.id,
                            child: Image.asset(
                              herbalList.imageUrl,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .42,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  herbalList.name,
                                  softWrap: false,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  herbalList.scientific,
                                  softWrap: true,
                                      maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent),
                      child: BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (context, state) {
                          return IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        title: const Text(
                                            "Are you sure you want to delete this Item ?"),
                                        titleTextStyle: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 20),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                context
                                                    .read<WishlistBloc>()
                                                    .add(
                                                        RemoveProductFromWishlist(
                                                            herbalList));
                                              },
                                              child: const Text("Yes")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("No"))
                                        ],
                                      );
                                    });
                              });
                        },
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                title: const Text(
                                    "Are you sure you want to delete this Item ?"),
                                titleTextStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 20),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"))
                                ],
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/model/herbals.dart';

class ItemCard extends StatelessWidget {
  final Herbal herbalList;
  final bool isWishlist;
  // ignore: prefer_typing_uninitialized_variables
  final press;
  const ItemCard({
    Key? key,
    required this.herbalList,
    required this.press,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading) {
          return  Center(
            // child: CircularProgressIndicator(),
            child: Image.asset('assets/UI/loader.gif' , width: 50,),
          );
        }

        if (state is WishlistLoaded) {
          final isWishlist = state.wishlist.herbalList.contains(herbalList);
          return GestureDetector(
            onTap: press,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2.0,
                            blurRadius: 2.0,
                          )
                        ],
                        color: Colors.white),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: isWishlist
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                            ),
                            Hero(
                              tag: herbalList.id,
                              child: Image.asset(
                                herbalList.imageUrl,
                                width: 70,
                                height: 70,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Divider(color: Colors.grey),
                            Text(
                              textAlign: TextAlign.center,
                              herbalList.name,
                              maxLines: 2,
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade800),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                herbalList.scientific,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                            //  isWishlist
                            //  ? Expanded(child:
                            //  IconButton(
                            //   onPressed:
                            //  (){}, icon: const Icon(Icons.favorite, color: Colors.green,)),): const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}

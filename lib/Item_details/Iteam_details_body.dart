import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';

// ignore: must_be_immutable
class ItemBody extends StatelessWidget {
  const ItemBody({
    Key? key,
    required this.herbalList,
  }) : super(key: key);
  final Herbal herbalList;
  //hex color
  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  //end hex
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final CarouselController _controller = CarouselController();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            //height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  //height: 500,
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(
                    top: size.height * .02,
                    left: 12,
                    right: 12,
                  ),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(29, 43, 43, 43),
                          spreadRadius: 60.0,
                          blurRadius: 30.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                    ),
                                    textAlign: TextAlign.justify,
                                    herbalList.definition,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Location",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                      ),
                                      textAlign: TextAlign.justify,
                                      herbalList.location),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Benefits",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                      ),
                                      textAlign: TextAlign.justify,
                                      herbalList.benefits),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Uses",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                      ),
                                      textAlign: TextAlign.justify,
                                      herbalList.uses),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (herbalList.addons == "blank") ...{
                                  Container()
                                } else ...{
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 252, 247, 221),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(5.0)
                                      // ),
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Color.fromARGB(255, 232, 195, 1),
                                        ),
                                        left: BorderSide(
                                            color: Color.fromARGB(
                                                255, 232, 195, 1),
                                            width: 5),
                                        right: BorderSide(
                                          color:
                                              Color.fromARGB(255, 232, 195, 1),
                                        ),
                                        top: BorderSide(
                                          color:
                                              Color.fromARGB(255, 232, 195, 1),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.error_rounded,
                                                color: Color.fromARGB(
                                                    255, 232, 195, 1),
                                              ),
                                              Text(
                                                "Warning",
                                                style: TextStyle(
                                                    fontFamily: "Segoe UI Bold",
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 232, 195, 1),
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Text(
                                                style: const TextStyle(
                                                  fontFamily: "Segoe UI",
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                textAlign: TextAlign.justify,
                                                herbalList.addons),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                },

                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Photos",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // StaggeredGrid.count(
                                //   crossAxisCount: 4,
                                //   mainAxisSpacing: 4,
                                //   crossAxisSpacing: 4,
                                //   children: [
                                //     StaggeredGridTile.fit(
                                //       crossAxisCellCount: 2,
                                //       child: FullScreenWidget(
                                //         backgroundColor: Colors.black,
                                //         child: Center(
                                //           child: Hero(
                                //             tag: 'sample1',
                                //             child: ClipRRect(
                                //               child: Image.asset(
                                //                 herbalList.image1,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     StaggeredGridTile.fit(
                                //       crossAxisCellCount: 2,
                                //       child: FullScreenWidget(
                                //         backgroundColor: Colors.black,
                                //         child: Center(
                                //           child: Hero(
                                //             tag: 'sample2',
                                //             child: ClipRRect(
                                //               child: Image.asset(
                                //                 herbalList.image2,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     StaggeredGridTile.fit(
                                //       crossAxisCellCount: 2,
                                //       child: FullScreenWidget(
                                //         backgroundColor: Colors.black,
                                //         child: Center(
                                //           child: Hero(
                                //             tag: 'sample3',
                                //             child: ClipRRect(
                                //               child: Image.asset(
                                //                 herbalList.image3,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     StaggeredGridTile.fit(
                                //       crossAxisCellCount: 2,
                                //       child: FullScreenWidget(
                                //         backgroundColor: Colors.black,
                                //         child: Center(
                                //           child: Hero(
                                //             tag: 'sample4',
                                //             child: ClipRRect(
                                //               child: Image.asset(
                                //                 herbalList.image4,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 200.0,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    autoPlay: true,
                                  ),
                                  items: [
                                    herbalList.image1,
                                    herbalList.image2,
                                    herbalList.image3,
                                    herbalList.image4,
                                    herbalList.image5
                                  ].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(7),
                                                      topRight:
                                                          Radius.circular(7),
                                                      bottomLeft:
                                                          Radius.circular(7),
                                                      bottomRight:
                                                          Radius.circular(7)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.7),
                                                  spreadRadius: 3,
                                                  blurRadius: 7,
                                                  offset: const Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                child: SizedBox.fromSize(
                                                  size:
                                                      const Size.fromRadius(48),
                                                  child: Image.asset(i,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                Center(
                  child: Column(
                    children: [
                      Hero(
                        tag: herbalList.id,
                        child: Image.asset(
                          herbalList.imageUrl,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Stack(children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                herbalList.name,
                                style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                              Text(
                                herbalList.scientific,
                                style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, top: 22.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                if (state is WishlistLoading) {
                                  return const CircularProgressIndicator();
                                }
                                if (state is WishlistLoaded) {
                                  final isWishlist = state.wishlist.herbalList
                                      .contains(herbalList);

                                  return IconButton(
                                    icon: isWishlist
                                        ? Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        159, 112, 112, 112),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 0))
                                              ],
                                              color: Color.fromARGB(
                                                  255, 224, 64, 117),
                                            ),
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                            ))
                                        : Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Color.fromARGB(
                                                  255, 224, 64, 117),
                                            ),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            )),
                                    onPressed: () {
                                      isWishlist
                                          ? context.read<WishlistBloc>().add(
                                              RemoveProductFromWishlist(
                                                  herbalList))
                                          : context.read<WishlistBloc>().add(
                                              AddProductToWishlist(herbalList));

                                      isWishlist
                                          ? showDeleteSnackBar(context)
                                          : showAddSnackBar(context);
                                    },

                                    // onPressed: isWishlist
                                    //     ? () => context.read<WishlistBloc>().add(
                                    //         RemoveProductFromWishlist(herbalList))
                                    //     : () => context
                                    //         .read<WishlistBloc>()
                                    //         .add(AddProductToWishlist(herbalList))
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAddSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Added to your favorite list',
          style: TextStyle(color: Colors.white)),
      backgroundColor: Color(hexColor('#2D9959')),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showDeleteSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text(
        'Removed to your favorite list',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(hexColor('#2D9959')),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

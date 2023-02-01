import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbal_application/block/wishlist/wishlist_bloc.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/model/herbals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../item_card/favcard.dart';

class ScanBody extends StatefulWidget {
  const ScanBody({super.key});
  @override
  // ignore: library_private_types_in_public_api
  ScanBodyState createState() => ScanBodyState();
  //hexcolor
}

class ScanBodyState extends State<ScanBody> {
  //  List<Herbal> herbalList = List.from(Herbal.herbalList);
  //  final Herbal herbal = [] as Herbal;
  //  late final Herbal herbal;
  // ScanBodyState(this.herbal,this.herbalList , {Key ? key,});
//  late List<Herbal> herbalList = List.from(Herbal.herbalList);
  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 105,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    var contain = Herbal.herbalList
        .where((element) => element.name == _output[0]['label']);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _loading
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: SizedBox(
                        width: 200,
                        child: FloatingActionButton.extended(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          heroTag: null,
                          backgroundColor: Color(hexColor('#55C596')),
                          foregroundColor: Colors.white,
                          onPressed: pickImage,
                          icon: const Icon(Icons.camera),
                          label: const Text('Take a photo'),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        heroTag: null,
                        onPressed: pickImage,
                        backgroundColor: Color(hexColor('#55C596')),
                        child: const Icon(Icons.camera),
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
              _loading
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: Container(
                        width: 200,
                        child: FloatingActionButton.extended(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          heroTag: null,
                          backgroundColor: Color(hexColor('#55C596')),
                          foregroundColor: Colors.white,
                          onPressed: pickGalleryImage,
                          icon: const Icon(Icons.image),
                          label: const Text('Camera roll'),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        heroTag: null,
                        onPressed: pickGalleryImage,
                        backgroundColor: Color(hexColor('#55C596')),
                        child: const Icon(Icons.image),
                      ),
                    ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: _loading
                      ? Column(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Scanner',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: 'Segoe UI',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              'assets/UI/logo.png',
                              height: 250,
                              // width: 300,
                            )
                          ],
                        )
                      : Column(children: <Widget>[
                          Container(
                            height: 250,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.file(_image)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 10, color: Colors.white),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_output.isNotEmpty) ...{
                            Column(
                              children: [
                                if (_output[0]['confidence'] >= 0.0 &&
                                    _output[0]['confidence'] <= 0.988) ...{
                                          // Text('${_output[0]['confidence']}'),
                                          // Text('${_output[0]['label']}'),
                                  Text('Invalid Image, Please try again'),
                                } else if (_output[0]['confidence'] >= 0.989 &&
                                    _output[0]['confidence'] <= 1.0) ...{
                                          // Text('${_output[0]['confidence']}'),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
      color: Color(hexColor('#E8F3F5')),
        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))
      ),
                                            child: Text(
                                    '${_output[0]['label']}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25),
                                  ),
                                          ),
                                  // Text(
                                  //   '${_output[0]['label']}',
                                  //   style: const TextStyle(
                                  //       fontFamily: 'Segoe UI',
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.black,
                                  //       fontSize: 25),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: contain.length,
                                      itemBuilder: (context, index) => ItemCard(
                                        herbalList: contain.elementAt(index),
                                        output: _output,
                                      ),
                                    ),
                                  ),
                                } else ...{
                                  Text('Invalid Image, Please try again')
                                }
                              ],
                            )
                          } else ...{
                            Text('Invalid Image, Please try again')
                          }
                          // _output != null
                          //     ? Column(
                          //         children: [
                          //           if (_output[0]['confidence'] >= 0.0 &&
                          //               _output[0]['confidence'] <= 0.988) ...{
                          //                                       Text('${_output[0]['confidence']}'),
                          //                                       Text('${_output[0]['label']}'),
                          //             Text('Invalid Image, Please try again'),
                          //           } else if (_output[0]['confidence'] >=
                          //                   0.989 &&
                          //               _output[0]['confidence'] <= 1.0) ...{
                          //                                       // Text('${_output[0]['confidence']}'),
                          //             Text(
                          //               '${_output[0]['label']}',
                          //               style: const TextStyle(
                          //                   fontFamily: 'Segoe UI',
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black,
                          //                   fontSize: 25),
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   left: 30, right: 30),
                          //               child: ListView.builder(
                          //                 shrinkWrap: true,
                          //                 physics:
                          //                     const BouncingScrollPhysics(),
                          //                 itemCount: contain.length,
                          //                 itemBuilder: (context, index) =>
                          //                     ItemCard(
                          //                   herbalList:
                          //                       contain.elementAt(index),
                          //                   output: _output,
                          //                 ),
                          //               ),
                          //             ),
                          //           } else ...{
                          //             Text('Error')
                          //           }
                          //         ],
                          //       )
                          //     : Container(),
                        ]),
                ),
              ),
            ],
          ),
        ));
  }
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

class ItemCard extends StatelessWidget {
  final Herbal herbalList;
  // ignore: prefer_typing_uninitialized_variables
  final output;
  // ignore: prefer_typing_uninitialized_variables

  const ItemCard({
    Key? key,
    required this.herbalList,
    this.output,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contain = Herbal.herbalList
        .where((element) => element.name == output[0]['label']);
    return Container(
      decoration: BoxDecoration(
      color: Color(hexColor('#E8F3F5')),
        // borderRadius: const BorderRadius.only(
        //                   topLeft: Radius.circular(24),
        //                   topRight: Radius.circular(24))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: <Widget>[
              Column(
                children: [
                  if (contain.isEmpty) ...[
                    const Text('Something Went Wrong'),
                  ] else
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                  //                               Center(
                                  //   child: Align(
                                  //     alignment: Alignment.center,
                                  //     child: Text(
                                  //       herbalList.name,
                                  //       style: const TextStyle(
                                  //       fontFamily: 'Segoe UI',
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.black,
                                  //       fontSize: 25),
                                  //     ),
                                  //   ),
                                  // ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        herbalList.scientific,
                                        style: const TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: BlocBuilder<WishlistBloc,
                                          WishlistState>(
                                        builder: (context, state) {
                                          if (state is WishlistLoading) {
                                            return const CircularProgressIndicator();
                                          }
                                          if (state is WishlistLoaded) {
                                            final isWishlist = state
                                                .wishlist.herbalList
                                                .contains(herbalList);

                                            return IconButton(
                                              icon: isWishlist
                                                  ? Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Color.fromARGB(
                                                                      159,
                                                                      112,
                                                                      112,
                                                                      112),
                                                              spreadRadius: 1,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(0, 0))
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
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
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
                                                    ? context
                                                        .read<WishlistBloc>()
                                                        .add(
                                                            RemoveProductFromWishlist(
                                                                herbalList))
                                                    : context
                                                        .read<WishlistBloc>()
                                                        .add(AddProductToWishlist(
                                                            herbalList));

                                                isWishlist
                                                    ? showDeleteSnackBar(context)
                                                    : showAddSnackBar(context);
                                              },
                                            );
                                          }
                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                  ),
                                  textAlign: TextAlign.justify,
                                  herbalList.definition,
                                ),
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                "Location",
                                style: TextStyle(
                                  fontFamily: "Segoe UI",
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
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
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                            ],
                          ),
                        )
                      ],
                    )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

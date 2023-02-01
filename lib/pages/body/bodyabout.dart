import 'package:flutter/material.dart';
import 'package:herbal_application/about_details/about_details_header.dart';
import 'package:herbal_application/model/developer.dart';
import 'package:herbal_application/pages/body/howto.dart';
import 'package:herbal_application/pages/body/howto/howtouse.dart';

class bodyabout extends StatelessWidget {
  const bodyabout({super.key});

  @override
  Widget build(BuildContext context) {
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
                  margin: EdgeInsets.only(top: size.height * 0.32),
                  padding: EdgeInsets.only(
                    top: size.height * .02,
                    left: 12,
                    right: 12,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, bottom: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Center(
                                  child: Text(
                                    'Developers',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontFamily: 'Segoe UI',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 680,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: developers.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 2,
                                                crossAxisSpacing: 2,
                                                childAspectRatio: 0.70,
                                              ),
                                              itemBuilder: (context, index) =>
                                                  ItemCard(
                                                developers: developers[index],
                                                press: () => Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        reverseTransitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        pageBuilder: ((context,
                                                                animation,
                                                                secondaryAnimation) =>
                                                            FadeTransition(
                                                              opacity:
                                                                  animation,
                                                              child: about_header(
                                                                  developers:
                                                                      developers[
                                                                          index]),
                                                            )))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                textAlign: TextAlign.justify,
                                '         The application will be very helpful to those who struggle to identify herbal plants and flowers. This application uses Artificial intelligence (AI) to identify the benefits of plants and flowers. The application will include a camera that takes a picture of a leaf and petals then processes it to produce text that describes the herbal’s name, uses, and availability.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HowToUse()),
                                );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('How to use',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        // fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Icon(Icons.arrow_right_alt,
                                    color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const HowToUse()));
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Color.fromARGB(255, 6, 92, 20)
                              //               .withOpacity(0.5),
                              //           spreadRadius: 1,
                              //           blurRadius: 4,
                              //           offset: Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //       gradient: const LinearGradient(
                              //         begin: Alignment.topRight,
                              //         end: Alignment.bottomLeft,
                              //         colors: [
                              //           Color.fromARGB(255, 114, 202, 117),
                              //           Color.fromARGB(255, 86, 180, 89),
                              //           // Color.fromARGB(255, 148, 207, 255),
                              //           // Colors.blue,
                              //         ],
                              //       ),
                              //       borderRadius: BorderRadius.circular(16),
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(
                              //           left: 20.0,
                              //           right: 20.0,
                              //           top: 5,
                              //           bottom: 5),
                              //       child: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               // ignore: prefer_const_literals_to_create_immutables
                              //               children: [
                              //                 const Text(
                              //                   'How to use?',
                              //                   style: TextStyle(
                              //                       fontFamily: 'Segoe UI',
                              //                       fontWeight: FontWeight.w700,
                              //                       color: Color.fromARGB(
                              //                           255, 255, 255, 255),
                              //                       fontSize: 20),
                              //                 ),
                              //                 Row(
                              //                   children: const [
                              //                     Text(
                              //                       'Read more',
                              //                       style: TextStyle(
                              //                           fontFamily: 'Segoe UI',
                              //                           decoration:
                              //                               TextDecoration
                              //                                   .underline,
                              //                           color: Color.fromARGB(
                              //                               255,
                              //                               255,
                              //                               255,
                              //                               255)),
                              //                     ),
                              //                     SizedBox(
                              //                       height: 50,
                              //                     ),
                              //                     Icon(
                              //                       Icons
                              //                           .arrow_circle_right_sharp,
                              //                       color: Colors.white,
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //             Image.asset(
                              //               'assets/howtouse/howto.png',
                              //               height: 100,
                              //             ),
                              //           ]),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
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
}

class ItemCard extends StatelessWidget {
  final Developers developers;
  // ignore: prefer_typing_uninitialized_variables
  final press;
  const ItemCard({
    Key? key,
    required this.developers,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    width: 190,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: developers.name,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          developers.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      developers.name,
                      style: const TextStyle(
                          fontFamily: "Segoe UI",
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

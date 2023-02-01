import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Item_details_header.dart';
import 'package:herbal_application/item_card/itemcard.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/seemore_flowers.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/seemore_plants.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                'Herbal ',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Text(
                'App',
                style: TextStyle(
                    fontSize: 26, fontFamily: 'Segoe UI', color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Health news
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Health News',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Segoe UI Italic",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // ignore: prefer_const_constructors
          SizedBox(height: 10),

          // cards
          Container(
            margin: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 20,
              right: 20,
            ),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(26),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                splashColor: Colors.black26,
                // ignore: deprecated_member_use
                onTap: () => launch('https://doh.gov.ph/news-clippings'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(
                      image: const AssetImage('assets/homedashboard/doh.jpg'),
                      height: 200,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.25),
                        BlendMode.darken,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // end of health news
          const SizedBox(
            height: 10,
          ),
          // This is the herbal plants
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Herbal Plants',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Segoe UI Italic",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Seemoreplant()),
                    );
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "Segoe UI",
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 25,
              right: 25,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.8,
                  ),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => ItemCard(
                      herbalList: filteredPlants[index],
                      press: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                        opacity: animation,
                                        child: Itemheader(
                                          herbalList: filteredPlants[index],
                                        ),
                                      )))),
                ),
              ),
            ),
          ),

          //start of herbal flower
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Herbal Flowers',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Segoe UI Italic",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Seemoreflower()),
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "Segoe UI",
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 25,
              right: 25,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => ItemCard(
                        herbalList: filteredFlowers[index],
                        press: () => Navigator.push(
                            // PageRouteBuilder(
                            // transitionDuration: const Duration(milliseconds: 500),
                            // reverseTransitionDuration: const Duration(milliseconds: 500),
                            // pageBuilder: ((context, animation, secondaryAnimation) =>
                            // FadeTransition(
                            //   opacity: animation,
                            //   child: Itemheader(herbalList: display_list[index]),
                            // )
                            // ))
                            context,
                            PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                          opacity: animation,
                                          child: Itemheader(
                                            herbalList: filteredFlowers[index],
                                          ),
                                        ))))),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ]),
        //end of herbal flower
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herbal_application/model/developer.dart';
import 'package:url_launcher/link.dart';

// ignore: must_be_immutable
class aboutBody extends StatelessWidget {
  aboutBody({
    Key? key,
    required this.developers,
  }) : super(key: key);
  final Developers developers;

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
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        // decoration: const BoxDecoration(
        //    gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Color.fromARGB(255, 4, 129, 129), Color.fromARGB(255, 10, 204, 52)]
        // )),
        child: Column(
          children: <Widget>[
            SizedBox(
              //height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    margin: EdgeInsets.only(top: size.height * 0.15),
                    padding: EdgeInsets.only(
                      top: size.height * 0.1,
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
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    developers.name,
                                   style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Segoe UI',
                                  ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                                    child: Divider(
                                      height: 15,
                                      color: Colors.lightGreen,
                                      thickness: 2,
                                      ),
                                  ),
                                  Text(
                                    developers.role,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey
                                    ),  
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.mail,
                                          color: Colors.green,
                                          ),
                                          const SizedBox(width: 5,),
                                        Text(
                                          developers.gmail,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                        ),
                                        const SizedBox(width: 5,),
                                      Text(
                                        developers.num,
                                        ),
                                    ],
                                  ),
                                   const Padding(
                                    padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                                    child: Divider(
                                      height: 15,
                                      color: Colors.lightGreen,
                                      thickness: 2,
                                      ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const Text(
                                    'Social Media',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Segoe UI Bold',
                                    ),
                                    ),

                                        Padding(
                                      padding: const EdgeInsets.only( top: 20.0),
                                      child: Link(
                                        uri: Uri.parse(developers.fb),
                                        builder: (context, followlink) => ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(width:1, color:Colors.green), 
                                            elevation: 0,
                                            shape: RoundedRectangleBorder( 
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                          onPressed: followlink, 
                                           child: Container(
                                          height: 30,
                                          width: 200,
                                          child: 
                                          const Center(
                                            child: Text('Facebook',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Segoe UI',
                                            ),
                                            )),
                                        ),
                                      ),
                                    )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only( top: 1.0),
                                      child: Link(
                                        uri: Uri.parse(developers.ig),
                                        builder: (context, followlink) => ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(width:1, color:Colors.green), 
                                            elevation: 0,
                                            shape: RoundedRectangleBorder( 
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                          onPressed: followlink, 
                                           child: Container(
                                          height: 30,
                                          width: 200,
                                          child: 
                                          const Center(
                                            child: Text('Instagram',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Segoe UI',
                                            ),
                                            )),
                                        ),
                                      ),
                                    )
                                    ),
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
                        Container(
                            decoration: BoxDecoration(
                            border: Border.all(color: Color(hexColor('#2D9959')),
                            width: 4),
                            borderRadius: BorderRadius.circular(100),
                            ),
                          margin: EdgeInsets.only(top: size.height * 0.02),
                          child: Hero(
                            tag: developers.name,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                width: 150,
                                height: 150,
                                developers.imageUrl,
                                fit: BoxFit.cover,
                              ),
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
      ),
    );
  }
}

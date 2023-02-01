import 'package:flutter/material.dart';
import 'package:herbal_application/pages/body/bodyabout.dart';

// ignore: use_key_in_widget_constructors
class About extends StatefulWidget{

  @override
  // ignore: library_private_types_in_public_api
  _AboutState createState() => _AboutState();
}

//hex color
  hexColor (String colorhercode){
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
  //end hex


class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context){
     return Scaffold(
      backgroundColor: Color(hexColor('#55C596')),
      appBar: buildAppBar(context),
      body: bodyabout(),
    );
  }
  
    AppBar buildAppBar(BuildContext context) {
    return AppBar(
          backgroundColor: Color(hexColor('#55C596')),
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'About ',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Segoe UI',
                      color: Colors.white),
                ),
                const Text(
                  'App',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          )
            );
    
          
        
  }
  }

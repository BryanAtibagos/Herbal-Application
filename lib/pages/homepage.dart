// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:herbal_application/assets/about_icon.dart';
import 'package:herbal_application/assets/favorite_icon.dart';
import 'package:herbal_application/assets/home_icon.dart';
import 'package:herbal_application/assets/list_icon.dart';
import 'package:herbal_application/assets/scan_icon.dart';
import 'package:herbal_application/pages/about.dart';
import 'package:herbal_application/pages/dashboard.dart';
import 'package:herbal_application/pages/favorites.dart';
import 'package:herbal_application/pages/plantlist.dart';
import 'package:herbal_application/pages/scan.dart';


// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

  //bottom Navigation Bar
class _HomeState extends State<HomePage>{
  int currentTab = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const PlantList(),
    const Favorites(),
    About()
  ];
  //End

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  //hex Color
  hexColor (String colorhercode){
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }



  @override
  Widget build(BuildContext context){
    
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: FloatingActionButton(
          backgroundColor:  Color(hexColor('#55C596')),
          child: const Icon(Scan_button.scan
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const scanPage()),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle (),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
               //leftmenu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = const Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Home_button.home_icon_new,
                          size: 25,
                          color: currentTab == 0 ? Color(hexColor('#55C596')) : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(color: currentTab == 0 ? Color(hexColor('#55C596')) : Colors.grey
                          ),
                        )
                      ],
                    ),
                    ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = const PlantList();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Leaf_button.leaf,
                          size: 25,
                          color: currentTab == 1 ? Color(hexColor('#55C596')) : Colors.grey,
                        ),
                        Text(
                          'Herbal',
                          style: TextStyle(color: currentTab == 1 ? Color(hexColor('#55C596')) : Colors.grey
                          ),
                        )
                      ],
                    ),
                    ),
                ],
              ),
              //rightmenu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = const Favorites();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Favorite_button.favorite,
                          size: 25,
                          color: currentTab == 3 ? Color(hexColor('#55C596')) : Colors.grey,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(color: currentTab == 3 ? Color(hexColor('#55C596')) : Colors.grey
                          ),
                        )
                      ],
                    ),
                    ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = About();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          About_button.about,
                          size: 25,
                          color: currentTab == 4 ? Color(hexColor('#55C596')) : Colors.grey,
                        ),
                        Text(
                          'About',
                          style: TextStyle(color: currentTab == 4 ? Color(hexColor('#55C596')) : Colors.grey
                          ),
                        )
                      ],
                    ),
                    ),
                ],
              )
            ],
          ),
        ),
      )
    ); 
  }
}
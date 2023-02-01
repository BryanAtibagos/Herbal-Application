import 'package:flutter/material.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/abdominal_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/all_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/colds_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/cough_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/earinfect_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/eyeinfect_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/hypertension_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/muscular_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/skindis_flower.dart';
import 'package:herbal_application/pages/seemore/seemore_flower/categoryflower/skininfect_flower.dart';


class Seemoreflower extends StatefulWidget {
  const Seemoreflower({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  SeemoreflowerListState createState() => SeemoreflowerListState();
}

class SeemoreflowerListState extends State<Seemoreflower>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  TextEditingController controller = TextEditingController();

  void updateList(String value) {
    setState(() {
      all_Flowers = seemoreflowers
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerAbdominal = abdominalFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerColds = coldsFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerCough = coughFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerEarInfect = earInfectFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerEyeInfect = eyeInfectFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerHypertension = hypertensionFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerMuscular = muscularFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerSkinDis = skinDisFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      flowerSkinInfect = skinInfectFlower
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //create a controller for an editable text field

    // code to search an items by its name

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Herbal',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                ' Plants',
                style: TextStyle(
                    fontSize: 26, fontFamily: 'Segoe UI', color: Colors.black),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          constraints: BoxConstraints(
            minHeight: 500, //minimum height
            minWidth: 300, // minimum width

            maxHeight: MediaQuery.of(context).size.height,
            //maximum height set to 100% of vertical height

            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Search bar
              Container(
                width: 350,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Search',
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 15.0,
                      ),
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                          fontFamily: "Segoe UI Bold Italic",
                          fontWeight: FontWeight.w400,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //categories
              SizedBox(
                height: 30,
                child: TabBar(
                    padding: const EdgeInsets.only(left: 20.0),
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.shade400,
                    ),
                    labelColor: Colors.white,
                    isScrollable: true,
                    unselectedLabelColor: const Color(0xFFCDCDCD),
                    tabs: const [
                      Tab(
                        child: Text('All',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Abdominal pain',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Colds',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Cough',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Ear infection',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Eye infection',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Hypertension',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Muscular sprain',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Skin disease',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                      Tab(
                        child: Text('Skin infection',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                            )),
                      ),
                    ]),
              ),

              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    all_Flower(),
                    abdominalFlower_Category(),
                    coldsFlower_Category(),
                    CoughFlower_Category(),
                    earInfecthFlower_Category(),
                    eyeInfecthFlower_Category(),
                    HypertensionFlower_Category(),
                    muscularFlower_Category(),
                    skindisFlower_Category(),
                    skinInfectFlower_Category(),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = all_Flowers.where((products) {
      final herbalTitle = products.name.toLowerCase();
      final input = query.toLowerCase();

      return herbalTitle.contains(input);
    }).toList();
    setState(() => all_Flowers = suggestions);
  }
}

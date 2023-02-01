import 'package:flutter/material.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/pages/category/All.dart';
import 'package:herbal_application/pages/category/abdominal.dart';
import 'package:herbal_application/pages/category/autoimmune.dart';
import 'package:herbal_application/pages/category/colds.dart';
import 'package:herbal_application/pages/category/cough.dart';
import 'package:herbal_application/pages/category/diabetes.dart';
import 'package:herbal_application/pages/category/earInfection.dart';
import 'package:herbal_application/pages/category/eyeInfection.dart';
import 'package:herbal_application/pages/category/headache.dart';
import 'package:herbal_application/pages/category/hypertension.dart';
import 'package:herbal_application/pages/category/kidneyInfect.dart';
import 'package:herbal_application/pages/category/muscular.dart';
import 'package:herbal_application/pages/category/skinInfection.dart';
import 'package:herbal_application/pages/category/skindisease.dart';
import 'package:herbal_application/pages/category/toothache.dart';

class PlantList extends StatefulWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 15, vsync: this);
  }

  TextEditingController controller = TextEditingController();

  //filter search
  void updateList(String value) {
    setState(() {
      listplants = display_list
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_headache = filteredHeadache
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_abdominal = filteredAbdominal
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Autoimmune = filteredAutoimmune
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Colds = filteredColds
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Cough = filteredCough
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Diabetes = filteredDiabetes
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_earInfect = filteredEarInfect
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_eyeInfect = filteredeyeInfect
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_headache = filteredHeadache
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Hypertension = filteredHypertension
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Kidney = filteredKidney
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Muscular = filteredMuscular
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Skindisease = filteredSkinDis
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_SkinInfect = filteredSkinInfect
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_Toothache = filteredToothache
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();

      // display_illness = filteredIllness.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  //end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'List of ',
                style: TextStyle(
                    fontSize: 26, fontFamily: 'Segoe UI', color: Colors.black),
              ),
              const Text(
                'Herbal',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
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
                        child: Text('Autoimmune disease',
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
                        child: Text('Diabetes',
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
                        child: Text('Headache',
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
                        child: Text('Kidney infection',
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
                      Tab(
                        child: Text('Toothache',
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
                    All_Category(),
                    abdominal_Category(),
                    Autoimmune_Category(),
                    Colds_Category(),
                    Cough_Category(),
                    Diabetes_Category(),
                    earInfect_Category(),
                    eyeInfect_Category(),
                    headache_Category(),
                    hypertension_Category(),
                    KidneyInfect_Category(),
                    Muscular_Category(),
                    Skindisease_Category(),
                    SkinInfect_Category(),
                    Toothache_Category(),
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
    final suggestions = display_list.where((products) {
      final herbalTitle = products.name.toLowerCase();
      final input = query.toLowerCase();

      return herbalTitle.contains(input);
    }).toList();
    setState(() => display_list = suggestions);
  }
}

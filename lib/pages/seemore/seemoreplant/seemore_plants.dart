import 'package:flutter/material.dart';
import 'package:herbal_application/model/category.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/abdominal_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/all_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/autoimmune_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/colds_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/cough_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/diabetes_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/earInfect_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/headache_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/hypertension_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/kidney_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/muscular_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/skindis_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/skininfect_plant.dart';
import 'package:herbal_application/pages/seemore/seemoreplant/categoryplants/toothache_plant.dart';

class Seemoreplant extends StatefulWidget {
  const Seemoreplant({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  SeemoreplantListState createState() => SeemoreplantListState();
}

class SeemoreplantListState extends State<Seemoreplant>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 14, vsync: this);
  }

  TextEditingController controller = TextEditingController();

  void updateList(String value) {
    setState(() {
      allPlants = seemoreplants
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantAbdominal = abdominalPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantAutoimmune = autoimmunePlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantColds = coldsPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantCough = coughPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantDiabetes = diabetesPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantEarInfect = earInfectPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantHeadache = headachePlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantHypertension = hypertensionPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantKidney = kidneyPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantMuscular = muscularPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantSkinDis = skinDisPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantSkinInfect = skinInfectPlant
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      plantToothache = toothachePlant
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
                    all_Plant(),
                    abdominalPlant_Category(),
                    autoimmunePlant_Category(),
                    coldsPlant_Category(),
                    CoughPlant_Category(),
                    DiabetesPlant_Category(),
                    earInfecthPlant_Category(),
                    headachePlant_Category(),
                    hypertensionPlant_Category(),
                    kidneyPlant_Category(),
                    muscularPlant_Category(),
                    skindisPlant_Category(),
                    skinInfectPlant_Category(),
                    toothachePlant_Category(),
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
    final suggestions = allPlants.where((products) {
      final herbalTitle = products.name.toLowerCase();
      final input = query.toLowerCase();

      return herbalTitle.contains(input);
    }).toList();
    setState(() => allPlants = suggestions);
  }
}

// define text that will searching
import 'package:herbal_application/model/herbals.dart';

String text = "";
List<String> favHerbalIds =[];
// define items
String categoryAbdominal="Abdominal Pain";
String categoryAutoimmune="Autoimmune Disease";
String categoryColds="Colds";
String categoryCough="Cough";
String categoryEarInfect="Ear Infection";
String categoryEyeInfect="Eye Infection";
String categoryDiabetes="Diabetes";
String categoryHeadache="Headache";
String categoryHypertension="Hypertension";
String categoryKidney="Kidney Infection";
String categoryMuscular="Muscular Sprain";
String categorySkinDis="Skin Disease";
String categorySkinInfect="Skin Infection";
String categoryToothache="Toothache";


String categoryPlants="plant";
String categoryFlowers="flower";
//category
//herbal List
List<Herbal> filteredAbdominal = Herbal.herbalList.where((e)=>e.category == categoryAbdominal).toList();
List<Herbal> filteredAutoimmune = Herbal.herbalList.where((e)=>e.category == categoryAutoimmune).toList();
List<Herbal> filteredColds = Herbal.herbalList.where((e)=>e.category == categoryColds).toList();
List<Herbal> filteredCough = Herbal.herbalList.where((e)=>e.category == categoryCough).toList();
List<Herbal> filteredDiabetes = Herbal.herbalList.where((e)=>e.category == categoryDiabetes).toList();
List<Herbal> filteredEarInfect = Herbal.herbalList.where((e)=>e.category == categoryEarInfect).toList();
List<Herbal> filteredeyeInfect = Herbal.herbalList.where((e)=>e.category == categoryEyeInfect).toList();
List<Herbal> filteredHeadache = Herbal.herbalList.where((e)=>e.category == categoryHeadache).toList();
List<Herbal> filteredHypertension = Herbal.herbalList.where((e)=>e.category == categoryHypertension).toList();
List<Herbal> filteredKidney = Herbal.herbalList.where((e)=>e.category == categoryKidney).toList();
List<Herbal> filteredMuscular = Herbal.herbalList.where((e)=>e.category == categoryMuscular).toList();
List<Herbal> filteredSkinDis = Herbal.herbalList.where((e)=>e.category == categorySkinDis).toList();
List<Herbal> filteredSkinInfect = Herbal.herbalList.where((e)=>e.category == categorySkinInfect).toList();
List<Herbal> filteredToothache = Herbal.herbalList.where((e)=>e.category == categoryToothache).toList();
//end

//plant list
List<Herbal> abdominalPlant = filteredPlants.where((e)=>e.category == categoryAbdominal).toList();
List<Herbal> autoimmunePlant = filteredPlants.where((e)=>e.category == categoryAutoimmune).toList();
List<Herbal> coldsPlant = filteredPlants.where((e)=>e.category == categoryColds).toList();
List<Herbal> coughPlant = filteredPlants.where((e)=>e.category == categoryCough).toList();
List<Herbal> diabetesPlant = filteredPlants.where((e)=>e.category == categoryDiabetes).toList();
List<Herbal> earInfectPlant = filteredPlants.where((e)=>e.category == categoryEarInfect).toList();
List<Herbal> headachePlant = filteredPlants.where((e)=>e.category == categoryHeadache).toList();
List<Herbal> hypertensionPlant = filteredPlants.where((e)=>e.category == categoryHypertension).toList();
List<Herbal> kidneyPlant = filteredPlants.where((e)=>e.category == categoryKidney).toList();
List<Herbal> muscularPlant = filteredPlants.where((e)=>e.category == categoryMuscular).toList();
List<Herbal> skinDisPlant = filteredPlants.where((e)=>e.category == categorySkinDis).toList();
List<Herbal> skinInfectPlant = filteredPlants.where((e)=>e.category == categorySkinInfect).toList();
List<Herbal> toothachePlant = filteredPlants.where((e)=>e.category == categoryToothache).toList();
//end

//flower list
List<Herbal> abdominalFlower = filteredFlowers.where((e)=>e.category == categoryAbdominal).toList();
List<Herbal> coldsFlower = filteredFlowers.where((e)=>e.category == categoryColds).toList();
List<Herbal> coughFlower = filteredFlowers.where((e)=>e.category == categoryCough).toList();
List<Herbal> earInfectFlower = filteredFlowers.where((e)=>e.category == categoryEarInfect).toList();
List<Herbal> eyeInfectFlower = filteredFlowers.where((e)=>e.category == categoryEyeInfect).toList();
List<Herbal> hypertensionFlower = filteredFlowers.where((e)=>e.category == categoryHypertension).toList();
List<Herbal> muscularFlower = filteredFlowers.where((e)=>e.category == categoryMuscular).toList();
List<Herbal> skinDisFlower = filteredFlowers.where((e)=>e.category == categorySkinDis).toList();
List<Herbal> skinInfectFlower = filteredFlowers.where((e)=>e.category == categorySkinInfect).toList();
//end

List<Herbal> filteredPlants = Herbal.herbalList.where((e)=>e.type == categoryPlants).toList();
List<Herbal> filteredFlowers = Herbal.herbalList.where((e)=>e.type == categoryFlowers).toList();
List<Herbal> seemoreplants = filteredPlants..sort((a, b) => a.name.compareTo(b.name));
List<Herbal> seemoreflowers = filteredFlowers..sort((a, b) => a.name.compareTo(b.name));

List<Herbal> listplants = Herbal.herbalList..sort((a, b) => a.name.compareTo(b.name));


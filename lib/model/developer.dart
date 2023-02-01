import 'package:hive/hive.dart';
// constructor of items

class Developers {
  final String name;
  final String gmail;
  final String imageUrl;
  final String num;
  final String role;
  final String fb;
  final String ig;

  Developers({
      required this.name,
      required this.gmail,
      required this.num,
      required this.imageUrl,
      required this.role,
      required this.fb,
      required this.ig,
      });

 
  
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [name, gmail, num,imageUrl, role, fb, ig];
 
      }

// define text that will searching

//list of herbal
List<Developers> developers = <Developers>[
  Developers(
    imageUrl: 'assets/developers/rio.jpg',
    role: 'Backend Developer',
    name: 'Rio R. Abesamis',
    gmail: 'rioabesamis012@gmail.com',
    num: '+63-9199004734',
    ig: 'https://www.instagram.com/rio.abesamis/',
    fb: 'https://www.facebook.com/rio.abesamis',
  ),
    Developers(
      imageUrl: 'assets/developers/bryan.jpg',
      role: 'Programmer & UI Designer',
    name: 'Bryan M. Atibagos',
    gmail: 'bryanatibagos@gmail.com',
    num: '+63-9776993928',
    ig: 'https://www.instagram.com/bryartsu/',
    fb: 'https://www.facebook.com/choutzuyumahlovess',
  ),
    Developers(
       imageUrl: 'assets/developers/brit.jpg',
       role: 'Backend Developer',
    name: 'Britney L. Fortaleza',
    gmail: 'fortalezabritney@gmail.com',
    num: '+63-9151149261',
    ig: 'https://www.instagram.com/britneyfrtlz/',
    fb: 'https://www.facebook.com/britneyfrtlz',
  ),
    Developers(
       imageUrl: 'assets/developers/maan.png',
       role: 'Backend Developer',
    name: 'Rheymalyn Ann B. Gregorio',
    gmail: 'gregoriorheymalyn@gmailcom',
    num: '+63-9353913071',
    ig: 'https://www.instagram.com/gregorio.maan/',
    fb: 'https://www.facebook.com/gregorio.rheymalyn',
  ),
    Developers(
       imageUrl: 'assets/developers/jere.jpg',
       role: 'UI Designer',
    name: 'Jeresa E. Mollera',
    gmail: 'mollera.jeresa@gmail.com',
    num: '+63-9153883350',
    ig: 'https://www.instagram.com/jrsmllr/',
    fb: 'https://www.facebook.com/jrsmllr/',
  ),

];
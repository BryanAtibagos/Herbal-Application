import 'package:flutter/material.dart';
import 'package:herbal_application/about_details/about_details_body.dart';
import 'package:herbal_application/model/developer.dart';

// ignore: must_be_immutable, camel_case_types
class about_header extends StatelessWidget {
  //hex color
  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  //end hex
  final Developers developers;
  // ignore: prefer_const_constructors_in_immutables
  about_header({super.key, required this.developers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(hexColor('#2D9959')),
      appBar: buildAppBar(context),
      body: aboutBody(developers: developers),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:  Color(hexColor('#2D9959')),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:herbal_application/pages/body/howto/howtouse.dart';

// ignore: camel_case_types
class HowTo extends StatelessWidget {
  const HowTo({super.key});

  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('#2D9959')),
      body: const HowToUse(),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:herbal_application/pages/body/scan_body.dart';

// ignore: camel_case_types
class scanPage extends StatelessWidget {
  const scanPage({super.key});

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
      appBar: buildAppBar(context),
      body: const ScanBody(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(hexColor('#E8F3F5')),
      elevation: 0,
      title: Container(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Scan ',
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
          )),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
          size: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [],
    );
  }
}

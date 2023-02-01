import 'package:flutter/material.dart';
import 'package:herbal_application/Item_details/Iteam_details_body.dart';
import 'package:herbal_application/model/herbals.dart';
import 'package:herbal_application/pdf/pdfApi.dart';
import 'package:herbal_application/pdf/pdfInvoiceApi.dart';
import 'package:herbal_application/pdf/invoice.dart';
import 'package:herbal_application/pdf/stringPdf.dart';

// ignore: must_be_immutable
class Itemheader extends StatelessWidget {
  //hex color
  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  //end hex
  final Herbal herbalList;
  // ignore: prefer_const_constructors_in_immutables
  Itemheader({super.key, required this.herbalList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor(herbalList.color)),
      appBar: buildAppBar(context),
      body: ItemBody(herbalList: herbalList),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(hexColor(herbalList.color)),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
            onPressed: () async {
              final invoice = Invoice(
                herbals: Herbals(
                    name: herbalList.name, 
                    scientific: herbalList.scientific,
                    definition: herbalList.definition
                    ),
                    items: [ 
                      InvoiceItem(
                      name: herbalList.name,
                      scientific: herbalList.scientific,
                      definition: herbalList.definition,
                      location: herbalList.location,
                      benefits: herbalList.benefits,
                      uses: herbalList.uses,
                      )
                    ]
              );

              final pdfFile = await PdfInvoiceApi.generate(invoice);

              // opening the pdf file
              PdfApi.openFile(pdfFile);
            },
            icon: const Icon(Icons.save)),
      ],
    );
  }
}

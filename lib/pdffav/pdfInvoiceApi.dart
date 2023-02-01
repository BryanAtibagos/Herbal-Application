import 'dart:io';

import 'package:herbal_application/pdffav/invoice.dart';
import 'package:herbal_application/pdffav/pdfApi.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(invoice),
        buildHeader(invoice)
      ]));

  return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }
  static Widget buildTitle(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Herbal Application'
      )
    ]
  );

     static Widget buildHeader(Invoice invoice) {
    final headers = [
      'name',

    ];
    final data = invoice.items.map((item) {

      return [
        item.name,
      ];
    }).toList();
    
  return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
     }

}
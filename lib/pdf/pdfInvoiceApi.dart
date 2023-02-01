import 'dart:io';
import 'package:herbal_application/pdf/invoice.dart';
import 'package:herbal_application/pdf/pdfApi.dart';
import 'package:pdf/widgets.dart';
class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();
  
    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(invoice),
        buildInvoice(invoice),
      ]
      ));

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

  

  static Widget buildInvoice(Invoice invoice) {

    final headers = [
      'Name',
      'Scientific',
      'Definition',
      'Location',
      'Benefits',
      'Uses'
    ];

    final data = invoice.items.map((item) {
      return[
        item.name,
        item.scientific,
        item.definition,
        item.location,
        item.benefits,
        item.uses,
      ];
    }).toList();


    return Table.fromTextArray(
      headers: headers,
      data: data,
      columnWidths: {
            0: const FixedColumnWidth(100.0),
            1: const FlexColumnWidth(100.0),
            2: const FixedColumnWidth(100.0),
            3: const FixedColumnWidth(100.0),
            4: const FixedColumnWidth(100.0),
            5: const FixedColumnWidth(100.0),
          },

      );
  }






}





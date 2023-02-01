import 'package:herbal_application/pdf/stringPdf.dart';


class Invoice {
  final Herbals herbals;
   final List<InvoiceItem> items;

  const Invoice({
     required this.items,
    required this.herbals,
  });
}


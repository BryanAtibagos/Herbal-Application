
class Invoice {
  List<InvoiceItem>items;

  Invoice({
    required this.items,
  });
}

class InvoiceItem {
  final String name;


  InvoiceItem({
    required this.name,
  });
}



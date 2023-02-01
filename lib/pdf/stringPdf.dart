class Herbals {
  final String name;
  final String scientific;
  final String definition;

  const Herbals({required this.name, required this.scientific, required this.definition,});
}

class InvoiceItem {
  final String location;
  final String benefits;
  final String name;
  final String definition;
  final String scientific;
  final String uses;

  const InvoiceItem({
    required this.name,
    required this.definition,
    required this.scientific,
    required this.location,
    required this.benefits,
    required this.uses,
    });
}
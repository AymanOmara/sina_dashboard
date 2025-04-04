enum ProductType {
  studentsEquipments(type: "student"),
  materials(type: "Materials"),
  machines(type: "Machines"),
  devices(type: "Devices"),
  consumables(type: "Equipment"),
  orthodontics(type: "Correction"),
  medicalClothes(type: "Clothes"),
  filesBurs(type: "Files");

  final String type;

  const ProductType({
    required this.type,
  });

  static ProductType fromString(String type) {
    for (var productType in ProductType.values) {
      if (productType.type == type) {
        return productType;
      }
    }
    return consumables;
  }
}

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
}

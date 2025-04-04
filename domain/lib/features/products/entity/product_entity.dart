class ProductEntity {
  final int productId;
  final String productName;
  final String productDescription;
  final String madeIn;
  final double price;
  final int amount;
  final String exDate;
  final String others;
  final String firstYear;
  final String secondYear;
  final String thirdYear;
  final String fourthYear;
  final String fifthYear;
  final String teeth;
  final String clothes;
  final String type;
  final double discount;
  final List<String> images;
  final String size;
  final String guarantee;
  final int rate;
  bool isFavorite = false;

  ProductEntity({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.madeIn,
    required this.price,
    required this.amount,
    required this.exDate,
    required this.others,
    required this.firstYear,
    required this.secondYear,
    required this.thirdYear,
    required this.fourthYear,
    required this.fifthYear,
    required this.teeth,
    required this.clothes,
    required this.type,
    required this.discount,
    required this.images,
    required this.size,
    required this.guarantee,
    required this.rate,
  });

  bool get hasDiscount => discount > 0;

  bool get available => amount > 0;

  Map<String, dynamic> toJson() {
    return {
      "ProductID": productId,
      "ProuductName": productName,
      "ProuductDescription": productDescription,
      "MadeIn": madeIn,
      "Price": price,
      "Amount": amount,
      "EXDate": exDate,
      "Others": others,
      "FirstYear": firstYear,
      "SecondYear": secondYear,
      "ThirdYear": thirdYear,
      "FourthYear": fourthYear,
      "FifthYear": fifthYear,
      "Teeth": teeth,
      "Clothes": clothes,
      "Type": type,
      "Discount": discount,
      "Images": images,
      "Size": size,
      "Guarantee": guarantee,
      "Rate": rate,
    };
  }
}

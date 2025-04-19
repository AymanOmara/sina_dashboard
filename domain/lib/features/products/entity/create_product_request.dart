import 'package:domain/features/products/entity/product_entity.dart';

class CreateProductRequest {
  String productName = "";
  String productDescription = "";
  String madeIn = "";
  double price = 0.0;
  int amount = 0;
  String exDate = "0";
  String others = "F";
  String firstYear = "F";
  String secondYear = "F";
  String thirdYear = "F";
  String fourthYear = "F";
  String fifthYear = "F";
  String type = "";
  double discount = 0.0;
  String firstPhoto = "";
  String secondPhoto = "";
  String thirdPhoto = "";
  String fourthPhoto = "";
  String fifthPhoto = "";
  String sixthPhoto = "";
  String size = "0";
  String guarantee = "خارج الضمان";
  int rate = 0;
  String clothes = "F";
  String teeth = "T";

  CreateProductRequest();

  CreateProductRequest.secondary(
    this.productName,
    this.productDescription,
    this.madeIn,
    this.price,
    this.amount,
    this.exDate,
    this.others,
    this.firstYear,
    this.secondYear,
    this.thirdYear,
    this.fourthYear,
    this.fifthYear,
    this.teeth,
    this.clothes,
    this.type,
    this.discount,
    this.size,
    this.guarantee,
    this.rate,
    this.firstPhoto,
    this.secondPhoto,
    this.thirdPhoto,
    this.fourthPhoto,
    this.fifthPhoto,
    this.sixthPhoto,
  );

  factory CreateProductRequest.fromProductEntity(ProductEntity product) {
    List<String> safeImages = List.generate(6, (index) {
      return index < product.images.length ? product.images[index] : "";
    });
    return CreateProductRequest.secondary(
      product.productName,
      product.productDescription,
      product.madeIn,
      product.price,
      product.amount,
      product.exDate,
      product.others,
      product.firstYear,
      product.secondYear,
      product.thirdYear,
      product.fourthYear,
      product.fifthYear,
      product.teeth,
      product.clothes,
      product.type,
      product.discount,
      product.size,
      product.guarantee,
      product.rate,
      safeImages[0],
      safeImages[1],
      safeImages[2],
      safeImages[3],
      safeImages[4],
      safeImages[5],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "prouductname": productName,
      "prouductdescription": productDescription,
      "madein": madeIn,
      "price": price,
      "amount": amount,
      "exdate": exDate,
      "others": others,
      "firstyear": firstYear,
      "secondyear": secondYear,
      "thirdyear": thirdYear,
      "fourthyear": fourthYear,
      "fifthyear": fifthYear,
      "type": type,
      "discount": discount,
      "firstphoto": firstPhoto,
      "secondphoto": secondPhoto,
      "thirdphoto": thirdPhoto,
      "fourthphoto": fourthPhoto,
      "fifthphoto": fifthPhoto,
      "sixthphoto": sixthPhoto,
      "size": size,
      "guarantee": guarantee,
      "rate": rate,
      "clothes": clothes,
      "teeth": teeth,
    };
  }
}

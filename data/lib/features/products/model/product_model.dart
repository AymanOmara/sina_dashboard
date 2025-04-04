import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:xml/xml.dart';

class Products implements DecodeAble<List<ProductModel?>, List> {
  @override
  List<ProductModel?> fromJson(List json) {
    return json.map((e) => ProductModel().fromJson(e)).toList() ?? [];
  }
}

class ProductModel implements DecodeAble<ProductModel?, Map<String, dynamic>> {
  final int? productID;
  final String? productName;
  final String? productDescription;
  final String? madeIn;
  final double? price;
  final int? amount;
  final String? exDate;
  final String? others;
  final String? firstYear;
  final String? secondYear;
  final String? thirdYear;
  final String? fourthYear;
  final String? fifthYear;
  final String? teeth;
  final String? clothes;
  final String? type;
  final double? discount;
  final String? firstPhoto;
  final String? secondPhoto;
  final String? thirdPhoto;
  final String? fourthPhoto;
  final String? fifthPhoto;
  final String? sixthPhoto;
  final String? size;
  final String? guarantee;

  ProductModel({
    this.productID,
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
    this.firstPhoto,
    this.secondPhoto,
    this.thirdPhoto,
    this.fourthPhoto,
    this.fifthPhoto,
    this.sixthPhoto,
    this.size,
    this.guarantee,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productid'] as int?,
      productName: json['prouductname'] as String?,
      productDescription: json['prouductdescription'] as String?,
      madeIn: json['madein'] as String?,
      price: json['price'],
      amount: json['amount'],
      exDate: json['exdate'] as String?,
      others: json['others'] as String?,
      firstYear: json['firstyear'] as String?,
      secondYear: json['secondyear'] as String?,
      thirdYear: json['thirdyear'] as String?,
      fourthYear: json['fourthyear'] as String?,
      fifthYear: json['fifthyear'] as String?,
      teeth: json['teeth'] as String?,
      clothes: json['clothes'] as String?,
      type: json['type'] as String?,
      discount: json['discount'],
      firstPhoto: json['firstphoto'] as String?,
      secondPhoto: json['secondphoto'] as String?,
      thirdPhoto: json['thirdphoto'] as String?,
      fourthPhoto: json['fourthphoto'] as String?,
      fifthPhoto: json['fifthphoto'] as String?,
      sixthPhoto: json['sixthphoto'] as String?,
      size: json['size'] as String?,
      guarantee: json['guarantee'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productid': productID,
      'prouductname': productName,
      'prouductdescription': productDescription,
      'madein': madeIn,
      'price': price,
      'amount': amount,
      'exdate': exDate,
      'others': others,
      'firstyear': firstYear,
      'secondyear': secondYear,
      'thirdyear': thirdYear,
      'fourthyear': fourthYear,
      'fifthyear': fifthYear,
      'teeth': teeth,
      'clothes': clothes,
      'type': type,
      'discount': discount,
      'firstphoto': firstPhoto,
      'secondphoto': secondPhoto,
      'thirdphoto': thirdPhoto,
      'fourthphoto': fourthPhoto,
      'fifthphoto': fifthPhoto,
      'sixthphoto': sixthPhoto,
      'size': size,
      'guarantee': guarantee,
    };
  }

  @override
  ProductModel? fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productId: productID ?? 0,
      // Default to 0 if null
      productName: productName ?? "Unknown",
      // Default to "Unknown" if null
      productDescription: productDescription ?? "No Description",
      madeIn: madeIn ?? "Unknown",
      price: price ?? 0,
      amount: amount ?? 0,
      exDate: exDate ?? "N/A",
      others: others ?? "N/A",
      firstYear: firstYear ?? "N/A",
      secondYear: secondYear ?? "N/A",
      thirdYear: thirdYear ?? "N/A",
      fourthYear: fourthYear ?? "N/A",
      fifthYear: fifthYear ?? "N/A",
      teeth: teeth ?? "N/A",
      clothes: clothes ?? "N/A",
      type: type ?? "N/A",
      discount: discount ?? 0,
      images: [
        firstPhoto ?? "",
        secondPhoto ?? "",
        thirdPhoto ?? "",
        fourthPhoto ?? "",
        fifthPhoto ?? "",
        sixthPhoto ?? ""
      ].where((photo) => photo.isNotEmpty).toList(),
      // Remove empty photo strings
      size: size ?? "Unknown",
      guarantee: guarantee ?? "No Guarantee",
      rate: 0, // Assuming a default rating of 0
    );
  }
}

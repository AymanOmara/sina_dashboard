import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:xml/xml.dart';

class BannerModel implements DecodeAble<BannerModel?, List> {
  List<String>? urls = [];

  BannerModel({this.urls});

  @override
  BannerModel fromJson(List json) {
    urls = json.map<String>((e) => e["link"]).toList();
    return BannerModel(urls: urls);
  }
}

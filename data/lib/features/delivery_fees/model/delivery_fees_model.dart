import 'package:data/network/decode_able.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';

class DeliveryFeesModel
    implements DecodeAble<DeliveryFeesModel, Map<String, dynamic>> {
  int? inCairo;
  int? outCairo;

  DeliveryFeesModel({
    this.inCairo,
    this.outCairo,
  });

  @override
  DeliveryFeesModel fromJson(Map<String, dynamic> json) {
    return DeliveryFeesModel(
      inCairo: json["cairofees"],
      outCairo: json["outCairoFees"],
    );
  }

  DeliveryFeesEntity toEntity() {
    return DeliveryFeesEntity(
      inCairo: inCairo ?? 0,
      outCairo: outCairo ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cairofees": inCairo,
      "outCairoFees": outCairo,
    };
  }

  factory DeliveryFeesModel.fromEntity(DeliveryFeesEntity entity) {
    return DeliveryFeesModel(
      inCairo: entity.inCairo,
      outCairo: entity.outCairo,
    );
  }
}

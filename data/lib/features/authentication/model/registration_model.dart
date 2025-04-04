import 'dart:convert';
import 'package:data/network/decode_able.dart';
import 'package:domain/features/authentication/entities/registration_response.dart';
import 'package:xml/xml.dart';

class RegistrationModel implements DecodeAble<RegistrationModel, String> {
  RegistrationResponseStatus? status;

  RegistrationModel({
    this.status,
  });

  @override
  RegistrationModel fromJson(String json) {
    try {

      final document = XmlDocument.parse(json);

      String jsonString = document.rootElement.innerText.trim();


      if (jsonString == "email" || jsonString == "phone" || jsonString == "false") {
        return RegistrationModel(status: RegistrationResponseStatus.fromString(jsonString));
      }

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      if (jsonData.containsKey("UserId") && jsonData.containsKey("UserEmail")) {
        return RegistrationModel(status:RegistrationResponseStatus.success);
      }

      return RegistrationModel(status:RegistrationResponseStatus.unknown);
    } catch (e) {
      return RegistrationModel(status:RegistrationResponseStatus.unknown);
    }
  }
}

import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/constants.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringValidation on String? {
  bool isNullOrEmpty() {
    return this == null || this?.isEmpty == true;
  }

  bool isValidEmail() {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this ?? "");
  }

  String extractUrl() {
    final RegExp regex = RegExp(r'\["(.*?)"\]');
    final Match? match = regex.firstMatch(this ?? "");

    if (match != null) {
      String url = match.group(1)!;
      return url;
    } else {
      return "";
    }
  }
}

class Formatter {
  Formatter._();

  static String currencyFormat(num currency) {
    final formatter = NumberFormat("#,##0.##", "en_US");
    return formatter.format(currency);
  }
}

class Validator {
  Validator._();

  static String? validateEmail(String? email) {
    if (email.isNullOrEmpty()) {
      return "required_field".tr;
    } else if (!email.isValidEmail()) {
      return "invalid_email".tr;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password.isNullOrEmpty()) {
      return "required_field".tr;
    } else if ((password?.length ?? 0) < 6) {
      return "password_too_short".tr;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
  ) {
    if (password.isNullOrEmpty()) {
      return "required_field".tr;
    } else if (confirmPassword != password) {
      return "passwords_dont_match".tr;
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone.isNullOrEmpty()) {
      return "required_field".tr;
    }
    final RegExp egyptPhoneNumberRegex = RegExp(
      r'^01[0125][0-9]{8}$',
    );
    if (egyptPhoneNumberRegex.hasMatch(phone ?? "")) {
      return null;
    }
    return "invalid_phone_number".tr;
  }

  static String? validateRequired(String? txt) {
    if (txt.isNullOrEmpty()) {
      return "required_field".tr;
    }
    return null;
  }
}

extension ArrayUtils<T> on List<T> {
  void updateWhere(bool Function(T) condition, T newItem) {
    final index = indexWhere(condition);
    if (index != -1) {
      this[index] = newItem;
    }
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri url = Uri(scheme: 'tel', path: phoneNumber);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
Future<void> openWhatsApp(String phoneNumber) async {
  final Uri url = Uri.parse("https://wa.me/$phoneNumber");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
Future<void> openUrl(String path) async {
  final Uri url = Uri.parse(path);

  if (await canLaunchUrl(url)) {
    await launchUrl(url,
        mode: LaunchMode.externalApplication); // Ensure it opens externally
  } else {
    throw 'Could not launch $url';
  }
}

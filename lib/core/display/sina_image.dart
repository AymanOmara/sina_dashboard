import 'dart:convert';
import 'dart:typed_data';

class SinaImage {
  final String base64Image;

  SinaImage({required this.base64Image});

  // Convert Base64 string to Uint8List for displaying in Image.memory
  Uint8List get imageBytes => base64Decode(base64Image);
}
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/sina_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImagePickerComponent extends StatefulWidget {
  final void Function(SinaImage) onImageSelected;
  final String imageTitle;
  final String oldImageUrl;

  const ImagePickerComponent({
    super.key,
    required this.onImageSelected,
    required this.imageTitle,
    required this.oldImageUrl,
  });

  @override
  State<StatefulWidget> createState() => _ImagePickerComponentState();
}

class _ImagePickerComponentState extends State<ImagePickerComponent> {
  final ImagePicker _picker = ImagePicker();
  SinaImage? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Uint8List imageBytes = await imageFile.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageBytes);

      if (originalImage != null) {
        int width = originalImage.width;
        int height = originalImage.height;
        int quality = 50; // Start with moderate compression
        String base64String = "";

        // Iteratively reduce size and quality until it fits within 1024 characters
        while (true) {
          img.Image resizedImage =
              img.copyResize(originalImage, width: width, height: height);
          Uint8List compressedBytes =
              Uint8List.fromList(img.encodeJpg(resizedImage, quality: quality));
          base64String = base64Encode(compressedBytes);

          // Check if within 1024 characters
          if (base64String.length <= 1024) {
            break; // Stop if it's small enough
          }

          // Reduce resolution and quality further
          width = (width * 0.8).toInt();
          height = (height * 0.8).toInt();
          quality -= 1;

          if (width < 20 || height < 20 || quality < 2) {
            print("Cannot compress further while keeping an acceptable image.");
            break;
          }
        }
        setState(() {
          _selectedImage = SinaImage(base64Image: base64String);
          widget.onImageSelected(_selectedImage!);
        });
        print("Final Base64 Length: ${base64String.length}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.imageTitle.tr),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _pickImage(),
          child: const Text("Pick Image"),
        ),
        const SizedBox(height: 10),
        widget.oldImageUrl.isNotEmpty && widget.oldImageUrl.isURL
            ? Image.network(
                widget.oldImageUrl,
                width: 150,
                height: 150,
              )
            : _selectedImage != null
                ? Image.memory(
                    _selectedImage!.imageBytes,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : const Text("No image selected"),
      ],
    );
  }
}

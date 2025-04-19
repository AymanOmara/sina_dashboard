import 'dart:convert';
import 'dart:typed_data';
import 'package:common/Urls.dart';
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
        int targetWidth = originalImage.width;
        int targetHeight = originalImage.height;

        // Scale down only if needed
        if (targetWidth > 400 || targetHeight > 400) {
          targetWidth = (originalImage.width * 0.4).toInt(); // reduce to 40%
          targetHeight = (originalImage.height * 0.4).toInt();
        }

        int quality = 40; // Lower quality for smaller size

        img.Image resizedImage = img.copyResize(originalImage,
            width: targetWidth, height: targetHeight);
        Uint8List compressedBytes = Uint8List.fromList(
          img.encodeJpg(resizedImage, quality: quality),
        );

        String base64String = base64Encode(compressedBytes);

        // Only accept if it’s under 2048 characters
        setState(() {
          _selectedImage = SinaImage(base64Image: base64String);
          widget.onImageSelected(_selectedImage!);
        });

        print("Base64 Length: ${base64String.length}");
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
        widget.oldImageUrl.isNotEmpty && widget.oldImageUrl.isURL && _selectedImage == null
            ? Image.network(
                Urls.baseProductImage + widget.oldImageUrl,
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

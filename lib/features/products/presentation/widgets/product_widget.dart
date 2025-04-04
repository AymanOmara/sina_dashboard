import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.changeFavoriteStatus,
  });

  final ProductEntity product;
  final void Function(ProductEntity product) changeFavoriteStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.productDetails,
          arguments: product,
        );
      },
      child: SizedBox(
        width: (Get.width - 30) / 2,
        child: Stack(
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: product.images.first,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/app_square_logo.png",
                  ),
                  fit: BoxFit.fill,
                ),
                Text(
                  product.productName,
                  textAlign: TextAlign.center,
                ),
                Text(
                  product.price.toString(),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.snackbar(
                          "success".tr,
                          "product_added_to_cart".tr,
                          backgroundColor: Colors.green,
                        );
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        changeFavoriteStatus(product);
                      },
                      icon: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 50,
                        color: product.isFavorite ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (product
                .hasDiscount) // Assuming 'hasDiscount' is a boolean property
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${product.discount}% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (!product.available)
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.6),
                  child: const Text(
                    "SOLD OUT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

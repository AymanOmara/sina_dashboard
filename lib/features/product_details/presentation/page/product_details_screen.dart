import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/product_details/business_logic/product_details_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductDetailsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                SinaTopNavigationBar(
                  title: "product_details".tr,
                ),
                CachedNetworkImage(
                  imageUrl: cubit.product.images.first,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 50),
                  fit: BoxFit.fill,
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text(
                        "product_overview".tr,
                        style: TextStyle(
                          color: orangeColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        cubit.product.productName,
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/location.png",
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            cubit.product.amount > 0
                                ? "available".tr
                                : "un_available".tr,
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "manufacturing".tr,
                        style: TextStyle(
                          color: orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.product.madeIn,
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.product.guarantee,
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "expiring_date".tr,
                        style: TextStyle(
                          color: orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.product.exDate,
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "price".tr,
                            style: TextStyle(
                              color: orangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            cubit.product.price.toString(),
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "egp".tr,
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

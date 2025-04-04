import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/ecis_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFavoritesResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }
      },
      builder: (context, state) {
        ProductsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(
                title: cubit.params.display.title,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SinaTextField(
                  title: "",
                  prefix: Icon(Icons.search),
                  placeholder: "search".tr,
                  onChanged: (txt) {
                    cubit.updateSearchTerm(txt);
                  },
                ),
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loading,
                  successWidget: Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: cubit.products
                            .where((pr) =>
                                pr.productName.contains(cubit.searchTerm))
                            .map((e) => ProductWidget(
                                  product: e,
                                  changeFavoriteStatus: (product) {
                                    cubit.handleFavorite(product);
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  onRetry: cubit.fetchProducts,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

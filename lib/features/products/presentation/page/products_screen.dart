import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/dimensions.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/widgets/product_data_grid_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
                title: "products".tr,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loading,
                  successWidget: Expanded(
                    child: SfDataGrid(
                      columnWidthMode: ColumnWidthMode.fill,
                      shrinkWrapRows: true,
                      onQueryRowHeight: (raw) {
                        return raw.getIntrinsicRowHeight(raw.rowIndex);
                      },
                      source: ProductDataGridSource(
                        products: cubit.products,
                        onDelete: cubit.onDelete,
                        onUpdate: cubit.onUpdate,
                      ),
                      columns: [
                        GridColumn(
                          columnName: 'id',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.gridRowPadding,
                            ),
                            child: Text(
                              'ID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'name',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.gridRowPadding,
                            ),
                            child: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'price',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.gridRowPadding),
                            child: Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'category',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.gridRowPadding),
                            child: Text(
                              'Category',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'actions',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.gridRowPadding),
                            child: Text(
                              'Actions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
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

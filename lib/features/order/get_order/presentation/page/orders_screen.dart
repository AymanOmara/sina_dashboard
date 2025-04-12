import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/dimensions.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/order/get_order/business_logic/orders_cubit.dart';
import 'package:ibn_sina_flutter/features/order/get_order/presentation/widgets/order_data_grid_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        // if (state is ProductsDeleteResult) {
        //   if (state.success) {
        //     Get.snackbar(
        //       "success".tr,
        //       state.message,
        //       backgroundColor: Colors.green,
        //       colorText: Colors.white,
        //     );
        //   } else {
        //     Get.snackbar(
        //       "error".tr,
        //       state.message,
        //       backgroundColor: Colors.red,
        //       colorText: Colors.white,
        //     );
        //   }
        // }
      },
      builder: (context, state) {
        OrdersCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(
                title: "orders".tr,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.createOrder,
                    // arguments: UpdateProductParams(
                    //   updateAble: cubit,
                    // ),
                  );
                },
                child: Text(
                  "add_new_order".tr,
                ),
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loading,
                  successWidget: Expanded(
                    child: SfDataGrid(
                      onCellTap: (cell) {
                        var index = cell.rowColumnIndex.rowIndex;
                        Navigator.pushNamed(
                          context,
                          AppRoutes.orderDetails,
                          arguments: cubit.orders[index],
                        );
                      },
                      columnWidthMode: ColumnWidthMode.fill,
                      shrinkWrapRows: true,
                      onQueryRowHeight: (raw) {
                        return raw.getIntrinsicRowHeight(raw.rowIndex);
                      },
                      source: OrderDataGridSource(
                        orders: cubit.orders,
                        onDelete: (t) {},
                        onUpdate: (product) {
                          // Navigator.of(context).pushNamed(
                          //   AppRoutes.addUpdateProduct,
                          //   arguments: UpdateProductParams(
                          //     product: product,
                          //     updateAble: cubit,
                          //   ),
                          // );
                        },
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'price',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.gridRowPadding,
                            ),
                            child: Text(
                              'price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'actions',
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.gridRowPadding,
                            ),
                            child: Text(
                              'Actions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onRetry: cubit.fetchOrders,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

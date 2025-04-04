import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/orders_history/business_logic/orders_history_cubit.dart';
import 'package:ibn_sina_flutter/features/orders_history/presentation/widgets/order_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersHistoryCubit, OrdersHistoryState>(
      builder: (context, state) {
        OrdersHistoryCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SinaTopNavigationBar(
                  title: "my_orders".tr,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: Container(
                            child: LoadingWidget(
                              emptyTitle: "empty_notifications".tr,
                              loadingState: cubit.loading,
                              successWidget: Expanded(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: cubit.orders
                                          .map(
                                            (e) => OrderHistoryWidget(
                                              order: e,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                              onRetry: cubit.fetchOrders,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

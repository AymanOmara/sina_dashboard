import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/sina_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/delivery/business_logic/delivery_cubit.dart';

class DeliveryFeesScreen extends StatelessWidget {
  DeliveryFeesScreen({super.key});

  final _inCairoController = TextEditingController();
  final _outSideCairoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {
        if (state is DeliveryGetResult) {
          _outSideCairoController.text = state.entity.outCairo.toString();
          _inCairoController.text = state.entity.inCairo.toString();
        }
        if (state is DeliveryUpdateResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              "delivery_fees_updated".tr,
              backgroundColor: Colors.green,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        DeliveryCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            spacing: 20,
            children: [
              SinaTopNavigationBar(
                title: "delivery_fees".tr,
              ),
              SinaTextField(
                controller: _inCairoController,
                title: "في القاهره",
                onChanged: (fees) {
                  cubit.deliveryFees?.inCairo = int.tryParse(fees) ?? 0;
                },
              ),
              SinaTextField(
                controller: _outSideCairoController,
                title: "خارج القاهره",
                onChanged: (fees) {
                  cubit.deliveryFees?.outCairo = int.tryParse(fees) ?? 0;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  cubit.updateDeliveryFees();
                },
                child: Text("update".tr),
              ),
            ],
          ),
        );
      },
    );
  }
}

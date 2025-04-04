import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipment_option.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_cubit.dart';
import 'package:ibn_sina_flutter/features/products/display/product_list_params.dart';

class StudentEquipmentsWidget extends StatelessWidget {
  const StudentEquipmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentEquipmentsCubit, StudentEquipmentsState>(
        builder: (context, state) {
      StudentEquipmentsCubit cubit = BlocProvider.of(context);
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 0,
        backgroundColor: blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: blue,
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "year_of_study".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeFirstYear();
                  },
                  title: "first_year".tr,
                  isSelected: cubit.firstYear,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeSecondYear();
                  },
                  title: "second_year".tr,
                  isSelected: cubit.secondYear,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeThirdYear();
                  },
                  title: "third_year".tr,
                  isSelected: cubit.thirdYear,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeFourthYear();
                  },
                  title: "fourth_year".tr,
                  isSelected: cubit.fourthYear,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeFifthYear();
                  },
                  title: "fifth_year".tr,
                  isSelected: cubit.fifthYear,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeOther();
                  },
                  title: "other_equipment".tr,
                  isSelected: cubit.other,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeTeeth();
                  },
                  title: "teeth".tr,
                  isSelected: cubit.teeth,
                ),
                StudentEquipmentOption(
                  onChange: (selected) {
                    cubit.changeClothes();
                  },
                  title: "cloths".tr,
                  isSelected: cubit.clothes,
                ),
                InkWell(
                  onTap: () {
                    cubit.request.categoryName =
                        cubit.category.productType.type;
                    Navigator.of(context).pushNamed(
                      AppRoutes.products,
                      arguments: ProductListParams(
                        request: cubit.request,
                        display: cubit.category,
                      ),
                    );
                  },
                  child: Text(
                    "enter".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

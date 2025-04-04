import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/home/display/i_user_logged_in_state.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_button.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';

class SinaNavigationDrawer extends StatelessWidget {
  const SinaNavigationDrawer({
    super.key,
    required this.userLoggedInState,
  });

  final IUserLoggedInState userLoggedInState;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SinaDrawerCubit>(),
      child: BlocConsumer<SinaDrawerCubit, SinaDrawerState>(
        listener: (context, state) {
          if (state is SinaDrawerLogoutUser) {
            Get.snackbar(
              "success".tr,
              "logout_success".tr,
              backgroundColor: Colors.green,
            );
          } else if (state is SinaDrawerDeleteAccountResult) {
            state.result.fold(onSuccess: (data) {
              if (data) {
                userLoggedInState.onLogout();
                Get.snackbar(
                  "success".tr,
                  "account_deleted_successfully".tr,
                  backgroundColor: Colors.green,
                );
              } else {
                Get.snackbar(
                  "error".tr,
                  "error".tr,
                  backgroundColor: Colors.red,
                );
              }
            }, onFailure: (e) {
              Get.snackbar(
                "error".tr,
                e.message,
                backgroundColor: Colors.red,
              );
            });
          }
        },
        builder: (context, state) {
          SinaDrawerCubit cubit = BlocProvider.of(context);
          return Container(
            width: Get.width * 0.5,
            height: Get.height - 20,
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
            child:
                cubit.isUserLoggedIn ? _loggedInUser(cubit) : _unLoggedInUser(),
          );
        },
      ),
    );
  }

  Widget _loggedInUser(SinaDrawerCubit cubit) {
    return Column(
      children: [
        SizedBox(
          height: Get.mediaQuery.padding.top + 20,
        ),
        Text(
          cubit.user?.userName ?? "",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SinaDrawerButton(
            title: "my_orders".tr,
            onTap: () {
              Get.toNamed(AppRoutes.orderHistory);
            }),
        SinaDrawerButton(
            title: "contact_us".tr,
            onTap: () {
              Get.toNamed(AppRoutes.contactUs);
            }),
        SinaDrawerButton(
          title: "favorites".tr,
          onTap: () {
            Get.toNamed(AppRoutes.favorites);
          },
        ),
        SinaDrawerButton(
            title: "notifications".tr,
            onTap: () {
              Get.toNamed(AppRoutes.notifications);
            }),
        SinaDrawerButton(
            title: "logout".tr,
            onTap: () {
              cubit.logout();
              userLoggedInState.onLogout();
            }),
        SinaDrawerButton(
            title: "delete_account".tr,
            onTap: () {
              cubit.deleteAccount();
            }),
        cubit.loading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : SizedBox()
      ],
    );
  }

  Widget _unLoggedInUser() {
    return Column(
      children: [
        SizedBox(
          height: Get.mediaQuery.padding.top + 20,
        ),
        SinaDrawerButton(
            title: "login".tr,
            onTap: () {
              Get.toNamed(
                AppRoutes.login,
                arguments: userLoggedInState,
              );
            }),
        SinaDrawerButton(
            title: "create_account".tr,
            onTap: () {
              Get.toNamed(AppRoutes.registration);
            }),
        SinaDrawerButton(
            title: "contact_us".tr,
            onTap: () {
              Get.toNamed(AppRoutes.contactUs);
            }),
      ],
    );
  }
}

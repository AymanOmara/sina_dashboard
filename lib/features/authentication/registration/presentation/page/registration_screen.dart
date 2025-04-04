import 'package:domain/features/authentication/entities/registration_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:ibn_sina_flutter/core/ui/ecis_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/loading/sina_loading_button.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/business_logic/registration_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationResult) {
          state.result.fold(onSuccess: (data) {
            if (data != null) {
              Get.back();
              Get.snackbar(
                "success".tr,
                "registration_success".tr,
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
              e.message.tr,
              backgroundColor: Colors.red,
            );
          });
        }
      },
      builder: (context, state) {
        RegistrationCubit cubit = BlocProvider.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.mediaQuery.padding.top + 20,
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(
                          Get.locale?.languageCode == "en" ? 0 : 3.14,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/back.png",
                            color: orangeColor,
                            width: 30,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "create_new_account".tr,
                        style: TextStyle(
                          color: orangeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 20,
                        children: [
                          SinaTextField(
                            title: "user_name".tr,
                            onChanged: (userName) {
                              cubit.entity.userName = userName;
                            },
                            validator: Validator.validateRequired,
                          ),
                          SinaTextField(
                            title: "email".tr,
                            onChanged: (email) {
                              cubit.entity.email = email;
                            },
                            validator: Validator.validateEmail,
                          ),
                          SinaTextField.password(
                            title: "password".tr,
                            validator: Validator.validatePassword,
                            obscureText: cubit.passwordObscure,
                            onPress: () {
                              cubit.updatePasswordVisibility();
                            },
                            onChange: (password) {
                              cubit.entity.password = password;
                            },
                          ),
                          SinaTextField.password(
                            title: "confirm_password".tr,
                            validator: (password) =>
                                Validator.validateConfirmPassword(
                              cubit.entity.confirmPassword,
                              password,
                            ),
                            obscureText: cubit.confirmPasswordObscure,
                            onPress: () {
                              cubit.updateConfirmPasswordVisibility();
                            },
                            onChange: (password) {
                              cubit.entity.confirmPassword = password;
                            },
                          ),
                          SinaLoadingButton(
                            loadingState: cubit.loading,
                            child: InkWell(
                              onTap: () {
                                if (formKey.currentState?.validate() == true) {
                                  cubit.submit();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                ),
                                child: Text(
                                  "registration".tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

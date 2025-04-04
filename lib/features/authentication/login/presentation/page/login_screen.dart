import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:ibn_sina_flutter/core/ui/ecis_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/loading/sina_loading_button.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginResult) {
          state.result.fold(
            onSuccess: (data) {
              if (!data) {
                Get.snackbar("error".tr, "invalid_login".tr,
                    backgroundColor: Colors.red);
              } else {
                Get.back();
                Get.snackbar("success".tr, "login_success".tr,
                    backgroundColor: Colors.green);
              }
            },
            onFailure: (e) {
              Get.snackbar("error".tr, e.message, backgroundColor: Colors.red);
            },
          );
        }
      },
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 20,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: 30,
                        ),
                      ),
                      SizedBox(
                        height: 220,
                      ),
                      SinaTextField(
                        title: "email".tr,
                        onChanged: (email) {
                          cubit.email = email;
                        },
                        validator: Validator.validateEmail,
                      ),
                      SinaTextField(
                        title: "password".tr,
                        obscureText: true,
                        onChanged: (password) {
                          cubit.password = password;
                        },
                        validator: Validator.validatePassword,
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
                              "login".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

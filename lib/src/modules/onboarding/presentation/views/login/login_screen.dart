import 'package:teya/src/core/components/back_page_button.dart';
import 'package:teya/src/core/components/custom_elevated_button.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/components/textformfields/custom_textformfield.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/core/resources/sizes/size_config.dart';
import 'package:teya/src/core/resources/string/string_constant.dart';
import 'package:teya/src/core/utils/field_validator.dart';
import 'package:teya/src/modules/dashboard/dashboard_module.dart';
import 'package:teya/src/modules/onboarding/onboarding_module.dart';

import 'package:teya/src/modules/onboarding/presentation/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Pallet.transparent,
        leading: const BackPageButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: StringConfig.text.login,
                  weight: FontWeight.bold,
                  size: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: StringConfig.text.inputDetailsBelow,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: StringConfig.text.email,
                  validator: (value) {
                    return FieldValidator.validateEmail(
                      value,
                      StringConfig.text.invalidEmail,
                    );
                  },
                  onChanged: (value) {
                    authController.validateLoginData();
                  },
                  onSaved: (value) {
                    authController.user.email = value!;
                  },
                ),
                CustomTextFormField(
                  labelText: StringConfig.text.password,
                  obscureText: true,
                  validator: (value) {
                    return FieldValidator.validateFieldNotEmpty(
                      value,
                      StringConfig.text.required.toString(),
                    );
                  },
                  onChanged: (value) {
                    authController.validateLoginData();
                  },
                  onSaved: (value) {
                    authController.user.password = value!;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: CustomElevatedButton(
                    label: StringConfig.text.continueWord,
                    isLoading: authController.isLoginLoading.value,
                    key: const Key("continue"),
                    onPressed: !authController.isLoginFormDataValid.value
                        ? null
                        : () {
                            authController.loginUser();
                          },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: StringConfig.text.dontHaveAccount,
                    ),
                    CustomText(
                      text: StringConfig.text.signUp,
                      color: Pallet.primary,
                      weight: FontWeight.bold,
                      onTap: () {
                        Get.offNamedUntil(
                            OnboardingModule.createAccountScreen.name,
                            (route) => false);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

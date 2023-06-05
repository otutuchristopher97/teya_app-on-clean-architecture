import 'package:teya/src/core/components/back_page_button.dart';
import 'package:teya/src/core/components/custom_elevated_button.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/components/textformfields/custom_textformfield.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/core/resources/sizes/size_config.dart';
import 'package:teya/src/core/resources/string/string_constant.dart';
import 'package:teya/src/core/utils/field_validator.dart';

import 'package:teya/src/modules/onboarding/onboarding_module.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
            key: authController.regFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: StringConfig.text.createAccount,
                  weight: FontWeight.bold,
                  size: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: StringConfig.text.provideDetails,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: StringConfig.text.firstName,
                        validator: (value) {
                          return FieldValidator.validateFieldNotEmpty(
                            value,
                            StringConfig.text.invalidFirstname,
                          );
                        },
                        onChanged: (value) {
                          authController.validateRegData();
                        },
                        onSaved: (value) {
                          authController.user.firstname = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: StringConfig.text.lastName,
                        validator: (value) {
                          return FieldValidator.validateFieldNotEmpty(
                            value,
                            StringConfig.text.invalidLastname,
                          );
                        },
                        onChanged: (value) {
                          authController.validateRegData();
                        },
                        onSaved: (value) {
                          authController.user.lastname = value!;
                        },
                      ),
                    )
                  ],
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
                    authController.validateRegData();
                  },
                  onSaved: (value) {
                    authController.user.email = value!;
                  },
                ),
                CustomTextFormField(
                  labelText: StringConfig.text.password,
                  obscureText: true,
                  controller: authController.passwordController,
                  validator: (value) {
                    dynamic val1 = FieldValidator.validateFieldNotEmpty(
                      value,
                      StringConfig.text.required,
                    );

                    dynamic val2 =
                        FieldValidator.validatePassword(value, "Password must be 8 - 16 characters and contain both number and letter/special characters");

                    if (val1 != null) {
                      return StringConfig.text.invalidPassword;
                    } else if (val2 != null) {
                      return StringConfig.text.wakePassword;
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    authController.validateRegData();
                  },
                  onSaved: (value) {
                    authController.user.password = value!;
                  },
                ),
                CustomTextFormField(
                  labelText: StringConfig.text.confirmPassword,
                  obscureText: true,
                  validator: (value) {
                    if (authController.passwordController.text.isEmpty) {
                      return null;
                    }
                    return FieldValidator.validateValueIsEqual(
                      value,
                      authController.passwordController.text,
                      StringConfig.text.passwwordMismatch,
                    );
                  },
                  onChanged: (value) {
                    authController.validateRegData();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: CustomElevatedButton(
                    label: StringConfig.text.continueWord,
                    key: const Key("continue"),
                    isLoading: authController.isRegLoading.value,
                    onPressed: !authController.isRegFormDataValid.value
                        ? null
                        : () {
                            authController.createAccount();
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
                      text: StringConfig.text.alreadyHaveAccount,
                    ),
                    CustomText(
                      text: StringConfig.text.login,
                      color: Pallet.primary,
                      weight: FontWeight.bold,
                      onTap: () {
                        Get.offNamed(OnboardingModule.loginScreen.name);
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

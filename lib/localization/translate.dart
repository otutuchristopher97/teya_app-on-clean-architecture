import 'package:teya/localization/translation_keys.dart';
import 'package:get/get.dart';

class Translation {
  static Translation? _it;
  static Translation instance() {
    return _it ??= Translation();
  }

  String get createAccount {
    return TranslationKeys.createAccount.tr;
  }

  String get provideDetails {
    return TranslationKeys.provideDetails.tr;
  }

  String get firstName {
    return TranslationKeys.firstName.tr;
  }

  String get invalidFirstname {
    return TranslationKeys.invalidFirstname.tr;
  }

  String get lastName {
    return TranslationKeys.lastName.tr;
  }

  String get invalidLastname {
    return TranslationKeys.invalidLastname.tr;
  }

  String get email {
    return TranslationKeys.email.tr;
  }

  String get invalidEmail {
    return TranslationKeys.invalidEmail.tr;
  }

  String get password {
    return TranslationKeys.password.tr;
  }

  String get required {
    return TranslationKeys.required.tr;
  }

  String get invalidPassword {
    return TranslationKeys.invalidPassword.tr;
  }

  String get wakePassword {
    return TranslationKeys.wakePassword.tr;
  }

  String get confirmPassword {
    return TranslationKeys.confirmPassword.tr;
  }

  String get passwwordMismatch {
    return TranslationKeys.passwwordMismatch.tr;
  }

  String get continueWord {
    return TranslationKeys.continueWord.tr;
  }

  String get alreadyHaveAccount {
    return TranslationKeys.alreadyHaveAccount.tr;
  }

  String get login {
    return TranslationKeys.login.tr;
  }

  String get inputDetailsBelow {
    return TranslationKeys.inputDetailsBelow.tr;
  }

  String get dontHaveAccount {
    return TranslationKeys.dontHaveAccount.tr;
  }

  String get signUp {
    return TranslationKeys.signUp.tr;
  }

  String get iHaveAccount {
    return TranslationKeys.iHaveAccount.tr;
  }

  String get armChat {
    return TranslationKeys.armChat.tr;
  }

  String get typeMessageHere {
    return TranslationKeys.typeMessageHere.tr;
  }

  String get send {
    return TranslationKeys.send.tr;
  }

  String get illustratorOneTitle {
    return TranslationKeys.illustratorOneTitle.tr;
  }

  String get illustratorOneMsg {
    return TranslationKeys.illustratorOneMsg.tr;
  }

  String get illustratorTwoTitle {
    return TranslationKeys.illustratorTwoTitle.tr;
  }

  String get illustratorTwoMsg {
    return TranslationKeys.illustratorTwoMsg.tr;
  }

  String get illustratorThreeTitle {
    return TranslationKeys.illustratorThreeTitle.tr;
  }

  String get illustratorThreeMsg {
    return TranslationKeys.illustratorThreeMsg.tr;
  }

  String get yourLanguage {
    return TranslationKeys.yourLanguage.tr;
  }

  String get otherLanguage {
    return TranslationKeys.otherLanguage.tr;
  }

  String get languageSettings {
    return TranslationKeys.languageSettings.tr;
  }

  String get success {
    return TranslationKeys.success.tr;
  }

  String get languageSettingsUpdated {
    return TranslationKeys.languageSettingsUpdated.tr;
  }
}

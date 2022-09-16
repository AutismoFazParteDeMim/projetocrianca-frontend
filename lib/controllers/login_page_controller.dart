import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgotPassFormKey = GlobalKey<FormState>();

  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passFieldController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get forgotPassFormKey => _forgotPassFormKey;

  TextEditingController get emailFieldController => _emailFieldController;
  TextEditingController get passFieldController => _passFieldController;

  @override
  void onClose() {
    _emailFieldController.dispose();
    _passFieldController.dispose();
    super.onClose();
  }

  String? emailValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (!value.isEmail) {
      return "Digite seu email corretamente.";
    }

    return null;
  }

  String? passValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (value.length < 8) {
      return "Sua senha deve conter no mínimo 08 caracteres.";
    }

    return null;
  }
}

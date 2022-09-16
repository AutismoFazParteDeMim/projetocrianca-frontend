import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _childFormKey = GlobalKey<FormState>();

  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passFieldController = TextEditingController();
  final TextEditingController _childFieldController = TextEditingController();
  final Rx<String> _childSex = "".obs;

  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get childFormKey => _childFormKey;

  TextEditingController get nameFieldController => _nameFieldController;
  TextEditingController get emailFieldController => _emailFieldController;
  TextEditingController get passFieldController => _passFieldController;
  TextEditingController get childFieldController => _childFieldController;
  String get childSex => _childSex.value;

  set setChildSex(value) => _childSex.value = value;

  @override
  void onClose() {
    _nameFieldController.dispose();
    _emailFieldController.dispose();
    _passFieldController.dispose();
    _childFieldController.dispose();
    super.onClose();
  }

  String? nameValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (value.length < 3) {
      return "O nome deve ter ao menos 3 caracteres!";
    }

    return null;
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

  String? confirmPassValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (value != _passFieldController.text) {
      return "As senhas não conferem.";
    }

    return null;
  }
}

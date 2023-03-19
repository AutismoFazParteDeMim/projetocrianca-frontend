import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/repositorys/auth_repository.dart';
import 'package:projeto_crianca/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/ui/widgets/alert_modal_component.dart';

class LoginPageController extends GetxController with DialogMixin {
  final AuthRepository repository;

  // keys dos formulários para controle de estado
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgotPassFormKey = GlobalKey<FormState>();

  // controladores dos inputs
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passFieldController = TextEditingController();

  // getters das keys dos forms
  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get forgotPassFormKey => _forgotPassFormKey;

  // getters dos controladores dos inputs
  TextEditingController get emailFieldController => _emailFieldController;
  TextEditingController get passFieldController => _passFieldController;

  LoginPageController(this.repository);

  @override
  void onClose() {
    super.onClose();

    // exclui os controladores do input
    // quando o controlador do login é excluído.
    _emailFieldController.dispose();
    _passFieldController.dispose();
  }

  // validador do capo de email
  String? emailValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (!value.isEmail) {
      return "Digite seu email corretamente.";
    }

    return null;
  }

  // validador do campo de senha
  String? passValidador(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (value.length < 8) {
      return "Sua senha deve conter no mínimo 08 caracteres.";
    }

    return null;
  }

  // método de login com email e senha
  Future<void> loginWithEmailAndPass() async {
    try {
      await repository.loginWithEmailAndPass(
        _emailFieldController.text,
        passFieldController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          showAlertDialog(
            title: "Ops!",
            message:
                "Parece que este email não está cadastrado. Verifique e tente novamente!",
            type: AlertModalComponentType.warning,
          );
          break;
        case "wrong-password":
          showAlertDialog(
            title: "Ops!",
            message:
                "Email ou senha digitados estão incorretos! Verifique e tente novamente",
            type: AlertModalComponentType.warning,
          );
          break;
        default:
          showAlertDialog(
            title: "Ops!",
            message: e.code,
            type: AlertModalComponentType.warning,
          );
      }
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }

  // método de login com google
  Future<void> loginWithGoogle() async {
    try {
      await repository.loginWithGoogle();
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.code,
        type: AlertModalComponentType.warning,
      );
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }

  // método de login com facebook
  Future<void> loginWithFacebook() async {
    try {
      await repository.loginWithFacebook();
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.code,
        type: AlertModalComponentType.warning,
      );
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }
}

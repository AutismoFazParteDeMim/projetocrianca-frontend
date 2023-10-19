// ignore_for_file: lines_longer_than_80_chars

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/repositories/auth_repository.dart';
import 'package:projeto_crianca/core/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/core/presentation/widgets/alert_modal_component.dart';

class LoginPageController extends GetxController with DialogMixin {
  LoginPageController(this.repository);

  final AuthRepository repository;

  //keys
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgotPassFormKey = GlobalKey<FormState>();

  // controllers
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passFieldController = TextEditingController();

  //getters
  GlobalKey<FormState> get getFormKey => _formKey;
  GlobalKey<FormState> get getForgotPassFormKey => _forgotPassFormKey;
  TextEditingController get getEmailFieldController => _emailFieldController;
  TextEditingController get getPassFieldController => _passFieldController;

  @override
  void onClose() {
    super.onClose();

    _emailFieldController.dispose();
    _passFieldController.dispose();
  }

  Future<void> loginWithEmailAndPass() async {
    try {
      await repository.loginWithEmailAndPass(
        _emailFieldController.text,
        _passFieldController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          showAlertDialog(
            title: 'Ops!',
            message:
                'Parece que este email não está cadastrado. Verifique e tente novamente!',
            type: AlertModalComponentType.warning,
          );
        case 'wrong-password':
          showAlertDialog(
            title: 'Ops!',
            message:
                'Email ou senha digitados estão incorretos! Verifique e tente novamente',
            type: AlertModalComponentType.warning,
          );
        default:
          showAlertDialog(
            title: 'Ops!',
            message: e.code,
            type: AlertModalComponentType.warning,
          );
      }
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await repository.loginWithGoogle();
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.code,
        type: AlertModalComponentType.warning,
      );
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      await repository.loginWithFacebook();
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.code,
        type: AlertModalComponentType.warning,
      );
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }

  Future<void> resetPassword() async {
    try {
      await repository.resetPassword(email: _emailFieldController.text);
      showAlertDialog(
        title: 'Email enviado!',
        message:
            'Verifique sua caixa de entrada, caso não encontre de uma olhadinha na caixa de Spam.',
        type: AlertModalComponentType.success,
      );
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.code,
        type: AlertModalComponentType.warning,
      );
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.error,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/register_page_controller.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/facebook_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/google_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/pass_input_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/components/image_checkbox_component.dart';
import 'package:projeto_crianca/ui/components/modal_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

enum _LoginType {
  google,
  facebook,
  emailAndPass,
}

class _Modal extends StatelessWidget {
  final _LoginType loginType;
  final RegisterPageController controller = Get.find<RegisterPageController>();

  _Modal({required this.loginType});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text("Qual o nome da criança?"),
                ],
              ),
              SizedBox(height: metrics.gap),
              Form(
                key: controller.childFormKey,
                child: TextInputComponent(
                  placeholder: "Digite o nome da criança",
                  icon: Ionicons.person_outline,
                  controller: controller.childFieldController,
                  action: TextInputAction.done,
                  validador: (String value) => controller.nameValidador(value),
                ),
              ),
              SizedBox(height: metrics.gap),
              Row(
                children: const [
                  Text("Qual o sexo da criança?"),
                ],
              ),
              SizedBox(height: metrics.gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => ImageCheckboxComponent(
                      isChecked: controller.childSex == "female" ? true : false,
                      image: const AssetImage("assets/icons/avatarF.png"),
                      text: "Feminino",
                      onChange: (bool value) =>
                          controller.setChildSex = "female",
                    ),
                  ),
                  SizedBox(width: metrics.gap * 2),
                  Obx(
                    () => ImageCheckboxComponent(
                      isChecked: controller.childSex == "male" ? true : false,
                      image: const AssetImage("assets/icons/avatarM.png"),
                      text: "Masculino",
                      onChange: (bool value) => controller.setChildSex = "male",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: metrics.gap),
        ButtonComponent(
          text: "Finalizar",
          icon: Ionicons.checkmark_circle_outline,
          onPressed: () {
            if (controller.childFormKey.currentState!.validate()) {
              if (loginType == _LoginType.emailAndPass) {
                controller.registerWithEmailAndPass();
              } else if (loginType == _LoginType.google) {
                controller.registerWithGoogle();
              } else if (loginType == _LoginType.facebook) {
                controller.registerWithFacebook();
              }
            }
          },
        ),
      ],
    );
  }
}

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Cadastre-se",
      ),
      body: Padding(
        padding: metrics.padding,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GoogleButtonComponent(
                      text: "Cadastrar com o Google",
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => ModalComponent(
                          title: "Cadastro da criança",
                          size: ModalComponentSize.medium,
                          child: _Modal(
                            loginType: _LoginType.google,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: metrics.gap),
                    FacebookButtonComponent(
                      text: "Cadastrar com Facebook",
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => ModalComponent(
                          title: "Cadastro da criança",
                          size: ModalComponentSize.medium,
                          child: _Modal(
                            loginType: _LoginType.facebook,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                const Text("ou"),
                SizedBox(height: metrics.gap),
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInputComponent(
                        controller: controller.nameFieldController,
                        placeholder: "Digite seu nome",
                        icon: Ionicons.person_outline,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.name],
                        validador: (String value) =>
                            controller.nameValidador(value),
                      ),
                      SizedBox(height: metrics.gap),
                      TextInputComponent(
                        controller: controller.emailFieldController,
                        placeholder: "Digite seu email",
                        icon: Ionicons.mail_outline,
                        type: TextInputType.emailAddress,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        validador: (String value) =>
                            controller.emailValidador(value),
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        controller: controller.passFieldController,
                        placeholder: "Digite uma senha",
                        icon: Ionicons.lock_closed_outline,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.newPassword],
                        validador: (String value) =>
                            controller.passValidador(value),
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        placeholder: "Digite novamente a senha",
                        icon: Ionicons.lock_closed_outline,
                        action: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        validador: (String value) =>
                            controller.confirmPassValidador(value),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: metrics.gap),
                ButtonComponent(
                  text: "Próximo",
                  icon: Ionicons.arrow_forward_outline,
                  reversed: true,
                  onPressed: () => {
                    if (controller.formKey.currentState!.validate())
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => ModalComponent(
                          title: "Cadastro da criança",
                          size: ModalComponentSize.medium,
                          child: _Modal(
                            loginType: _LoginType.emailAndPass,
                          ),
                        ),
                      ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
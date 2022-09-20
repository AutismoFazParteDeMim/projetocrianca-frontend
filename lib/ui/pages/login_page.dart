import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/login_page_controller.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/facebook_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/google_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/link_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/pass_input_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/components/modal_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _ForgotPasswordModal extends StatelessWidget {
  final LoginPageController controller = Get.find<LoginPageController>();

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
              const Text(
                "Te enviaremos por email um link para a redefinição da sua senha.",
              ),
              SizedBox(height: metrics.gap),
              Form(
                key: controller.forgotPassFormKey,
                child: TextInputComponent(
                  controller: controller.emailFieldController,
                  placeholder: "Digite seu email",
                  type: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  action: TextInputAction.next,
                  icon: Ionicons.mail_outline,
                  validador: (String value) => controller.emailValidador(value),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: metrics.gap),
        ButtonComponent(
          text: "Enviar email",
          icon: Ionicons.send_outline,
          reversed: true,
          onPressed: () => {},
        ),
      ],
    );
  }
}

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Login",
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
                      text: "Entrar com o Google",
                      onPressed: () => controller.loginWithGoogle(),
                    ),
                    SizedBox(height: metrics.gap),
                    FacebookButtonComponent(
                      text: "Entrar com Facebook",
                      onPressed: () => controller.loginWithFacebook(),
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
                        controller: controller.emailFieldController,
                        placeholder: "Digite seu email",
                        type: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        action: TextInputAction.next,
                        icon: Ionicons.mail_outline,
                        validador: (String value) =>
                            controller.emailValidador(value),
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        controller: controller.passFieldController,
                        autofillHints: const [AutofillHints.password],
                        placeholder: "Digite sua senha",
                        action: TextInputAction.done,
                        icon: Ionicons.lock_closed_outline,
                        validador: (String value) =>
                            controller.passValidador(value),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LinkButtonComponent(
                            text: "Esqueceu a senha?",
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => ModalComponent(
                                title: "Recuperação de senha",
                                child: _ForgotPasswordModal(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: metrics.gap),
                ButtonComponent(
                  text: "Entrar",
                  icon: Ionicons.enter_outline,
                  onPressed: () => {
                    if (controller.formKey.currentState!.validate())
                      {controller.loginWithEmailAndPass()}
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

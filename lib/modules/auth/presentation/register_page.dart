import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/mixins/validators_mixin.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/facebook_button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/google_button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/image_checkbox_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/inputs/pass_input_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/inputs/text_input_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/modal_component.dart';
import 'package:projeto_crianca/modules/auth/presentation/controllers/register_page_controller.dart';

enum _LoginType {
  google,
  facebook,
  emailAndPass,
}

class _Modal extends StatelessWidget with ValidatorsMixin {
  const _Modal({required this.loginType});

  final _LoginType loginType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterPageController>();
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text('Qual o nome da criança?'),
              ],
            ),
            SizedBox(height: metrics.gap),
            Form(
              key: controller.getChildFormKey,
              child: TextInputComponent(
                placeholder: 'Digite o nome da criança',
                icon: Ionicons.person_outline,
                controller: controller.getChildFieldController,
                action: TextInputAction.done,
                validador: nameValidador,
              ),
            ),
            SizedBox(height: metrics.gap),
            const Row(
              children: [
                Text('Qual o sexo da criança?'),
              ],
            ),
            SizedBox(height: metrics.gap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => ImageCheckboxComponent(
                    isChecked: controller.getChildSex == 'female' && true,
                    image: const AssetImage('assets/icons/avatarF.png'),
                    text: 'Feminino',
                    onChange: ({required bool isChecked}) =>
                        controller.setChildSex = 'female',
                  ),
                ),
                SizedBox(width: metrics.gap * 2),
                Obx(
                  () => ImageCheckboxComponent(
                    isChecked: controller.getChildSex == 'male' && true,
                    image: const AssetImage('assets/icons/avatarM.png'),
                    text: 'Masculino',
                    onChange: ({required bool isChecked}) =>
                        controller.setChildSex = 'male',
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: metrics.gap),
        ButtonWidget(
          text: 'Finalizar',
          icon: Ionicons.checkmark_circle_outline,
          onPressed: () {
            if (controller.getChildFormKey.currentState!.validate()) {
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

class RegisterPage extends GetView<RegisterPageController>
    with ValidatorsMixin {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Cadastre-se',
      ),
      body: Padding(
        padding: metrics.padding,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GoogleButtonWidget(
                      text: 'Cadastrar com o Google',
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => const ModalComponent(
                          title: 'Cadastro da criança',
                          child: _Modal(
                            loginType: _LoginType.google,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: metrics.gap),
                    FacebookButtonWidget(
                      text: 'Cadastrar com Facebook',
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => const ModalComponent(
                          title: 'Cadastro da criança',
                          child: _Modal(
                            loginType: _LoginType.facebook,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                const Text('ou'),
                SizedBox(height: metrics.gap),
                Form(
                  key: controller.getFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextInputComponent(
                        controller: controller.getNameFieldController,
                        placeholder: 'Digite seu nome',
                        icon: Ionicons.person_outline,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.name],
                        validador: nameValidador,
                      ),
                      SizedBox(height: metrics.gap),
                      TextInputComponent(
                        controller: controller.getEmailFieldController,
                        placeholder: 'Digite seu email',
                        icon: Ionicons.mail_outline,
                        type: TextInputType.emailAddress,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        validador: emailValidador,
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        controller: controller.getPassFieldController,
                        placeholder: 'Digite uma senha',
                        icon: Ionicons.lock_closed_outline,
                        action: TextInputAction.next,
                        autofillHints: const [AutofillHints.newPassword],
                        validador: passwordValidador,
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        placeholder: 'Digite novamente a senha',
                        icon: Ionicons.lock_closed_outline,
                        action: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        validador: (String? value) => equalValidador(
                          value,
                          controller.getPassFieldController.text,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: metrics.gap),
                ButtonWidget(
                  text: 'Próximo',
                  icon: Ionicons.arrow_forward_outline,
                  reversed: true,
                  onPressed: () => {
                    if (controller.getFormKey.currentState!.validate())
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => const ModalComponent(
                          title: 'Cadastro da criança',
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

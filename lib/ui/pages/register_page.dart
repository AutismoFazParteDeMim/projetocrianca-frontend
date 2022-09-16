import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/facebook_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/google_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/pass_input_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class RegisterPage extends GetView {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

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
                    const GoogleButtonComponent(
                      text: "Cadastrar com o Google",
                    ),
                    SizedBox(height: metrics.gap),
                    const FacebookButtonComponent(
                      text: "Cadastrar com Facebook",
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                const Text("ou"),
                SizedBox(height: metrics.gap),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInputComponent(
                        placeholder: "Digite seu nome",
                        type: TextInputType.emailAddress,
                        action: TextInputAction.next,
                        icon: Ionicons.person_outline,
                        onChange: (String value) => {},
                      ),
                      SizedBox(height: metrics.gap),
                      TextInputComponent(
                        placeholder: "Digite seu email",
                        type: TextInputType.emailAddress,
                        action: TextInputAction.next,
                        icon: Ionicons.mail_outline,
                        onChange: (String value) => {},
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        placeholder: "Digite uma senha",
                        icon: Ionicons.lock_closed_outline,
                        action: TextInputAction.next,
                        onChange: (String value) => {},
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        placeholder: "Digite novamente a senha",
                        action: TextInputAction.done,
                        icon: Ionicons.lock_closed_outline,
                        onChange: (String value) => {},
                      ),
                      SizedBox(height: metrics.gap),
                      const ButtonComponent(
                        text: "Cadastrar",
                        icon: Ionicons.checkmark_circle_outline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

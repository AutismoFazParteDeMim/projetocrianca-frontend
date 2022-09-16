import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/facebook_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/google_button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/link_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/pass_input_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class LoginPage extends GetView {
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
                const Image(
                  height: 200,
                  image: AssetImage("assets/login.png"),
                ),
                SizedBox(height: metrics.gap),
                Column(
                  children: [
                    const GoogleButtonComponent(
                      text: "Entrar com o Google",
                    ),
                    SizedBox(height: metrics.gap),
                    const FacebookButtonComponent(
                      text: "Entrar com Facebook",
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                const Text("ou"),
                SizedBox(height: metrics.gap),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextInputComponent(
                      placeholder: "Digite seu email",
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      icon: Ionicons.mail_outline,
                      onChange: (String value) => {},
                    ),
                    SizedBox(height: metrics.gap),
                    PassInputComponent(
                      placeholder: "Digite sua senha",
                      action: TextInputAction.done,
                      icon: Ionicons.lock_closed_outline,
                      onChange: (String value) => {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LinkButtonComponent(
                          text: "Esqueceu a senha?",
                          onPressed: () => {},
                        )
                      ],
                    ),
                    SizedBox(height: metrics.gap),
                    const ButtonComponent(
                      text: "Entrar",
                      icon: Ionicons.enter_outline,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

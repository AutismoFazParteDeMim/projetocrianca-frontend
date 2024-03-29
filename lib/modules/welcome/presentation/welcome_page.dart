// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/link_button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/modal_component.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;
    final colors = theme.extension<ThemeColors>()!;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              color: colors.primary,
              alignment: Alignment.center,
              padding: metrics.padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bem-Vindo(a)!',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: colors.onPrimary),
                  ),
                  SizedBox(height: metrics.gap * 2),
                  Text(
                    'Seja bem-vindo ao aplicativo do projeto Autismo Faz Parte de Mim.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: colors.onPrimary),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: metrics.padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: 'Fazer login',
                    onPressed: () => Get.toNamed<void>(AppRoutes.login),
                  ),
                  SizedBox(height: metrics.gap),
                  ButtonWidget(
                    text: 'Cadastre-se',
                    color: ButtonWidgetColor.secondary,
                    onPressed: () => Get.toNamed<void>(AppRoutes.register),
                  ),
                  SizedBox(height: metrics.gap),
                  LinkButtonWidget(
                    text: 'Política de privacidade',
                    onPressed: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) => const ModalComponent(
                        title: 'Política de privacidade',
                        fill: true,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Text(privacyPolicy),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String privacyPolicy = '''
Esta política de privacidade descreve como o aplicativo móvel Autismo Faz Parte de Mim ('o aplicativo') coleta, usa, compartilha e protege as informações pessoais dos usuários. Ao usar o aplicativo, você concorda com a coleta e uso de informações de acordo com esta política de privacidade.


-> Coleta e Uso de Informações Pessoais

Para personalizar a experiência do usuário, o aplicativo coleta o nome dos pais e da criança. Essas informações são usadas exclusivamente para fornecer um serviço personalizado para o usuário e não são compartilhadas com terceiros.

O aplicativo também usa o login do Google ou Facebook para autenticar os usuários. O aplicativo não armazena informações de login do Google ou Facebook. O aplicativo apenas acessa o nome de usuário e o endereço de e-mail para identificar o usuário.

Além disso, o aplicativo solicita a localização atual do usuário para mostrar no mapa centros e instituições de ajuda a crianças com TEA. A localização atual do usuário é usada apenas para exibir informações relevantes ao usuário e não é compartilhada com terceiros.


-> Compartilhamento de Informações

O aplicativo não compartilha informações pessoais com terceiros, exceto quando exigido por lei ou quando necessário para fornecer o serviço solicitado pelo usuário. O aplicativo pode compartilhar informações não pessoais, como dados estatísticos e de uso, com terceiros para fins de análise e melhoria do aplicativo.


-> Proteção de Informações

O aplicativo utiliza medidas de segurança padrão da indústria para proteger as informações pessoais dos usuários, incluindo criptografia de dados, armazenamento seguro e controle de acesso. No entanto, nenhuma transmissão de dados pela Internet ou armazenamento eletrônico é totalmente segura, e o aplicativo não pode garantir a segurança absoluta das informações dos usuários.


-> Alterações na Política de Privacidade

O aplicativo pode atualizar esta política de privacidade de tempos em tempos. A versão mais recente da política de privacidade estará sempre disponível no aplicativo.


-> Contato

Se você tiver alguma dúvida ou preocupação sobre esta política de privacidade, entre em contato conosco pelo endereço de e-mail autismofazpartedemim@gmail.com.


-> Data de Vigência

Esta política de privacidade entra em vigor a partir de 20 de março de 2023.
''';

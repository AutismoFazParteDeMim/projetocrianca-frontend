import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/github_button_component.dart';
import 'package:projeto_crianca/modules/about/presentation/controllers/about_page_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class _ContributorComponent extends StatelessWidget {
  const _ContributorComponent({
    required this.user,
    required this.photoUrl,
    required this.profileUrl,
  });

  final String user;
  final String photoUrl;
  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return SizedBox(
      width: 116,
      height: 116,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(profileUrl)),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                width: 80,
                height: 80,
                image: NetworkImage(photoUrl),
              ),
            ),
            SizedBox(height: metrics.gap / 2),
            Text(
              user,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends GetView<AboutPageController> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Sobre',
      ),
      body: Padding(
        padding: metrics.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(aboutText),
            SizedBox(height: metrics.gap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desenvolvedores',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: metrics.gap),
                  Obx(
                    () => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final contributor in controller.getContributors!)
                            _ContributorComponent(
                              user: contributor!.user!,
                              photoUrl: contributor.photoUrl!,
                              profileUrl: contributor.profileUrl!,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GitHubButtonWidget(
              text: 'GitHub',
              onPressed: () => launchUrl(
                Uri.parse(
                  'https://github.com/AutismoFazParteDeMim/ProjetoCrianca',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const creditsText = '''
Sound from zapsplat.com
''';

const aboutText = '''
A idealizadora do projeto Rose, uma mãe dedicada e uma cidadã exemplar, criou uma apostila para lidar com as dificuldades que ela mesma tinha em criar sua filha, e, além disso, fez cópias para ajudar outras mães que enfrentam a mesma dificuldade.

Com a ajuda do Farol entraram em contato com a Unisociesc que através dos projetos de extensão, permitiu o desenvolvimento de um aplicativo que conterá muito mais do que o conteúdo da apostila.

Com mentoria de Diego Possamai o aplicativo começou a ser desenvolvido em 2020 pelos alunos e hoje já conta com algumas atividades, jogos educativos e a personalização do avatar.
''';

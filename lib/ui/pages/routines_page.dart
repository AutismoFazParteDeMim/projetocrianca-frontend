import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _SliderChild extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const _SliderChild({
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(image)),
        Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RoutinesPage extends StatefulWidget {
  const RoutinesPage({super.key});

  @override
  State<StatefulWidget> createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    const List<Map> data = [
      {
        "title": "Acordar",
        "text": "Está na hora de acordar e ter um excelente dia!",
        "image": "assets/images/routines/1Acordar.png"
      },
      {
        "title": "Escovar os Dentes",
        "text": "Hora de escovar os dentes e manter sua boca saudável.",
        "image": "assets/images/routines/2EscovarOsDentes.png"
      },
      {
        "title": "Tomar Banho",
        "text": "Hora de tomar banho e se manter limpinho.",
        "image": "assets/images/routines/3TomarBanho.png"
      },
      {
        "title": "Café da Manhã",
        "text":
            "Hora de fazer uma refeição saudável e se manter bem alimentado.",
        "image": "assets/images/routines/4CafeDaManha.png"
      },
      {
        "title": "Usar o Banheiro",
        "text": "Fazer suas necessidades, não esqueça de lavar as mãos",
        "image": "assets/images/routines/5UsarBanheiro.png"
      },
      {
        "title": "Ir para escola",
        "text":
            "Hora de se arrumar e ir para escola aprender novas coisas e encontrar os amigos",
        "image": "assets/images/routines/6IrParaEscola.png"
      },
      {
        "title": "Estudar",
        "text": "Hora de fazer o dever de casa",
        "image": "assets/images/routines/7Estudar.png"
      },
      {
        "title": "Praticar Esportes",
        "text": "Hora de brincar, gastar suas energias e se divertir",
        "image": "assets/images/routines/8PraticarEsportes.png"
      },
      {
        "title": "Ir Dormir",
        "text": "Hora de dormir, ter uma boa noite de sono para o próximo dia",
        "image": "assets/images/routines/9Dormir.png"
      },
    ];

    return Scaffold(
      appBar: AppBarComponent(
        title: "Rotinas",
      ),
      body: Column(
        children: [
          Expanded(
              child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              initialPage: 0,
              onPageChanged: (index, reason) => setState(
                () {
                  _currentIndex = index;
                  log(_currentIndex.toString());
                },
              ),
            ),
            items: data
                .map((e) => _SliderChild(
                    title: e["title"], text: e["text"], image: e["image"]))
                .toList(),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        const EdgeInsets.only(top: 16, right: 10, bottom: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? colors.primary
                          : colors.secondary,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

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
    return Expanded(
        child: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Image(image: AssetImage(image)), Text(title), Text(text)],
    )));
  }
}

class RoutinesPage extends StatelessWidget {
  const RoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    const List<Map> data = [
      {
        "title": "Acordar",
        "text": "Está na hora de acordar e ter um excelente dia!",
        "image": "assets/login.png"
      },
      {
        "key": 2,
        "title": "Escovar os Dentes",
        "text": "Hora de escovar os dentes e manter sua boca saudável.",
        "image": "assets/login.png"
      },
      {
        "key": 3,
        "title": "Tomar Banho",
        "text": "Hora de tomar banho e se manter limpinho.",
        "image": "assets/login.png"
      },
      {
        "key": 4,
        "title": "Café da Manhã",
        "text":
            "Hora de fazer uma refeição saudável e se manter bem alimentado.",
        "image": "assets/login.png"
      },
      {
        "key": 5,
        "title": "Usar o Banheiro",
        "text": "Fazer suas necessidades, não esqueça de lavar as mãos",
        "image": "assets/login.png"
      },
      {
        "key": 6,
        "title": "Ir para escola",
        "text":
            "Hora de se arrumar e ir para escola aprender novas coisas e encontrar os amigos",
        "image": "assets/login.png"
      },
      {
        "key": 7,
        "title": "Estudar",
        "text": "Hora de fazer o dever de casa",
        "image": "assets/login.png"
      },
      {
        "key": 8,
        "title": "Praticar Esportes",
        "text": "Hora de brincar, gastar suas energias e se divertir",
        "image": "assets/login.png"
      },
      {
        "key": 9,
        "title": "Ir Dormir",
        "text": "Hora de dormir, ter uma boa noite de sono para o próximo dia",
        "image": "assets/login.png"
      },
    ];

    return Scaffold(
        appBar: AppBarComponent(
          title: "Rotinas",
        ),
        body: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              _current = index;
            },
            enableInfiniteScroll: false,
            initialPage: 0,
          ),
          items: data
              .map((e) => _SliderChild(
                  title: e["title"], text: e["text"], image: e["image"]))
              .toList(),
        ));
  }
}

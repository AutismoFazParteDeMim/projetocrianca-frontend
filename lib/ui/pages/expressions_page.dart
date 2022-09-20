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

class ExpressionsPage extends StatelessWidget {
  const ExpressionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    const List<Map> data = [
      {
        "key": '1',
        "title": "Alegre",
        "text":
            'Ebaaa! Estou muito alegre!!! Vou poder brincar bastante hoje, meus amiguinhos(a) vão trazer seus brinquedos para a gente brincar junto, estou muito feliz e muito alegre.',
        "image": "assets/login.png"
      },
      {
        "key": '2',
        "title": "Confuso",
        "text":
            'Não estou entendendo. Não entendo, meu amiguinhos estão demorando para chegar, será que eles já estão chegando?',
        "image": "assets/login.png"
      },
      {
        "key": '3',
        "title": "Em dúvida",
        "text":
            'Por que os passarinhos não vem comigo? por que? Quero ele, por que ele não vem comigo?',
        "image": "assets/login.png"
      },
      {
        "key": '4',
        "title": "Estou bem",
        "text":
            'Hoje fui brincar com meus amiguinhos(a) e acabei caindo, mas falei para o meu amiguinho(a) que estava bem e que já quero voltar a brincar.',
        "image": "assets/login.png"
      },
      {
        "key": '5',
        "title": "Feliz",
        "text":
            'Estou muito feliz, hoje vou comer minha comida preferida, estou muito feliz. Adoro comer minha comida preferida!',
        "image": "assets/login.png"
      },
      {
        "key": '6',
        "title": "Nâo estou feliz",
        "text":
            'Não estou feliz, me mandaram dormir cedo hoje e não quero dormir agora, agora eu quero brincar!',
        "image": "assets/login.png"
      },
      {
        "key": '7',
        "title": "Triste",
        "text":
            'Estou muito triste, é uma sensação que eu não gosto de sentir e que me dá muita vontade de chorar.',
        "image": "assets/login.png"
      },
      {
        "key": '8',
        "title": "Estou com Raiva",
        "text":
            'Não acredito! Por que isso aconteceu? Não gostei não e agora estou muito bravo(a).',
        "image": "assets/login.png"
      },
      {
        "key": '9',
        "title": "Surpreso",
        "text": 'Nossa! Algo inesperado aconteceu.',
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

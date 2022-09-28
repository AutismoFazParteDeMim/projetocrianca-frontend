import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/components/slider_component.dart';

class ExpressionsPage extends StatelessWidget {
  const ExpressionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map> data = [
      {
        "key": '1',
        "title": "Alegre",
        "text":
            'Ebaaa! Estou muito alegre!!! Vou poder brincar bastante hoje, meus amiguinhos(a) vão trazer seus brinquedos para a gente brincar junto, estou muito feliz e muito alegre.',
        "image": "assets/images/expressions/1Alegre.png"
      },
      {
        "key": '2',
        "title": "Confuso",
        "text":
            'Não estou entendendo. Não entendo, meu amiguinhos estão demorando para chegar, será que eles já estão chegando?',
        "image": "assets/images/expressions/2Confuso.png"
      },
      {
        "key": '3',
        "title": "Em dúvida",
        "text":
            'Por que os passarinhos não vem comigo? por que? Quero ele, por que ele não vem comigo?',
        "image": "assets/images/expressions/3EmDuvida.png"
      },
      {
        "key": '4',
        "title": "Estou bem",
        "text":
            'Hoje fui brincar com meus amiguinhos(a) e acabei caindo, mas falei para o meu amiguinho(a) que estava bem e que já quero voltar a brincar.',
        "image": "assets/images/expressions/4EstouBem.png"
      },
      {
        "key": '5',
        "title": "Feliz",
        "text":
            'Estou muito feliz, hoje vou comer minha comida preferida, estou muito feliz. Adoro comer minha comida preferida!',
        "image": "assets/images/expressions/5Feliz.png"
      },
      {
        "key": '6',
        "title": "Não estou feliz",
        "text":
            'Não estou feliz, me mandaram dormir cedo hoje e não quero dormir agora, agora eu quero brincar!',
        "image": "assets/images/expressions/6Infeliz.png"
      },
      {
        "key": '7',
        "title": "Triste",
        "text":
            'Estou muito triste, é uma sensação que eu não gosto de sentir e que me dá muita vontade de chorar.',
        "image": "assets/images/expressions/7Triste.png"
      },
      {
        "key": '8',
        "title": "Estou com Raiva",
        "text":
            'Não acredito! Por que isso aconteceu? Não gostei não e agora estou muito bravo(a).',
        "image": "assets/images/expressions/8Raiva.png"
      },
      {
        "key": '9',
        "title": "Surpreso",
        "text": 'Nossa! Algo inesperado aconteceu.',
        "image": "assets/images/expressions/9Surpreso.png"
      },
    ];

    return Scaffold(
        appBar: AppBarComponent(
          title: "Expressões",
        ),
        body: const SliderComponent(data: data));
  }
}

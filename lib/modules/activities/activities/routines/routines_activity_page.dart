// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/slider_component.dart';

class RoutinesActivityPage extends StatelessWidget {
  const RoutinesActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    const data = [
      {
        'title': 'Acordar',
        'text': 'Está na hora de acordar e ter um excelente dia!',
        'image': 'assets/images/routines/1Acordar.png',
      },
      {
        'title': 'Escovar os Dentes',
        'text': 'Hora de escovar os dentes e manter sua boca saudável.',
        'image': 'assets/images/routines/2EscovarOsDentes.png',
      },
      {
        'title': 'Tomar Banho',
        'text': 'Hora de tomar banho e se manter limpinho.',
        'image': 'assets/images/routines/3TomarBanho.png',
      },
      {
        'title': 'Café da Manhã',
        'text':
            'Hora de fazer uma refeição saudável e se manter bem alimentado.',
        'image': 'assets/images/routines/4CafeDaManha.png',
      },
      {
        'title': 'Usar o Banheiro',
        'text': 'Fazer suas necessidades, não esqueça de lavar as mãos',
        'image': 'assets/images/routines/5UsarBanheiro.png',
      },
      {
        'title': 'Ir para escola',
        'text':
            'Hora de se arrumar e ir para escola aprender novas coisas e encontrar os amigos',
        'image': 'assets/images/routines/6IrParaEscola.png',
      },
      {
        'title': 'Estudar',
        'text': 'Hora de fazer o dever de casa',
        'image': 'assets/images/routines/7Estudar.png',
      },
      {
        'title': 'Praticar Esportes',
        'text': 'Hora de brincar, gastar suas energias e se divertir',
        'image': 'assets/images/routines/8PraticarEsportes.png',
      },
      {
        'title': 'Ir Dormir',
        'text': 'Hora de dormir, ter uma boa noite de sono para o próximo dia',
        'image': 'assets/images/routines/9Dormir.png',
      },
    ];

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Rotinas',
      ),
      body: const SliderComponent(data: data),
    );
  }
}

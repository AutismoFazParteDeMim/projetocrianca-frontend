import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/numbers_activity_engine.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';

class NumbersActivityPage extends StatelessWidget {
  const NumbersActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Alfabeto",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<NumbersActivityEngine>(
        game: NumbersActivityEngine(),
      ),
    );
  }
}

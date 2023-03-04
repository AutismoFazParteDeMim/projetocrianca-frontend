import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';

class AlphabetActivityPage extends StatelessWidget {
  const AlphabetActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Expressões",
      ),
      body: GameWidget(
        game: AlphabetActivityEngine(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Jogos",
      ),
      body: const Center(
        child: Text("Jogos"),
      ),
    );
  }
}

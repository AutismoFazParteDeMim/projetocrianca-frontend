import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Atividades",
      ),
      body: const Center(
        child: Text("Atividades"),
      ),
    );
  }
}

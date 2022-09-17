import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Sobre",
      ),
      body: const Center(
        child: Text("Sobre"),
      ),
    );
  }
}

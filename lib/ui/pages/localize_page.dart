import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class LocalizePage extends StatelessWidget {
  const LocalizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Localizar",
      ),
      body: const Center(
        child: Text("Localizar"),
      ),
    );
  }
}

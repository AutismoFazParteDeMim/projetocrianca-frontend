import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Perfil",
      ),
      body: const Center(
        child: Text("Perfil"),
      ),
    );
  }
}

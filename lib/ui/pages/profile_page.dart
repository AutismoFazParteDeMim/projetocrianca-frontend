import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/profile_controler.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class ProfilePage extends GetView<ProfileController> {
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

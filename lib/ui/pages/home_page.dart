import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Home",
      ) ,
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}

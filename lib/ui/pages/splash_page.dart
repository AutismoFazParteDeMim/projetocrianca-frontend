import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(
      "assets/splash-video.mp4",
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then(
        (value) => setState(() => controller.play()),
      );

    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoutes.welcome),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 260,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}

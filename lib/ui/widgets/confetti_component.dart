import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ConfettiComponent extends StatefulWidget {
  const ConfettiComponent({
    super.key,
  });

  @override
  State<ConfettiComponent> createState() => _ConfettiComponentState();
}

class _ConfettiComponentState extends State<ConfettiComponent> {
  final controller = ConfettiController();
  bool isPlaying = false;
  static double top = -pi / 2;
  static double down = pi / 2;
  static double left = pi;
  static double right = 0;

  final double blastDirection = top;

  @override
  void didUpdateWidget(covariant ConfettiComponent oldWidget) {
    controller.play();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    return Center(
      child: ConfettiWidget(
        confettiController: controller,
        shouldLoop: true,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        colors: [
          colors.primary,
          colors.error,
          colors.warning,
          colors.success,
        ],
        numberOfParticles: 10,
      ),
    );
  }
}

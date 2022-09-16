import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class FacebookButtonComponent extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;

  const FacebookButtonComponent({
    super.key,
    required this.text,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    //final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: metrics.borderRadius,
        boxShadow: const [
          BoxShadow(
            blurRadius: 0,
            color: Color(0xFF365592),
            offset: Offset(0, 4),
          )
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPress,
        fillColor: const Color(0xFF4267B2),
        padding: metrics.padding,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: metrics.borderRadius),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Ionicons.logo_facebook),
            SizedBox(width: metrics.gap),
            Text(text),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGComponent extends StatelessWidget {
  final String rawSvg;
  final double width;
  final double height;

  const SVGComponent({
    super.key,
    required this.rawSvg,
    required this.width,
    required this.height,
  });

  Future<RawImage?> getSVG() async {
    try {
      final DrawableRoot svgRoot = await svg.fromSvgString(rawSvg, rawSvg);
      final Picture picture = svgRoot.toPicture();

      return RawImage(
        width: width,
        height: height,
        filterQuality: FilterQuality.high,
        alignment: Alignment.center,
        image: await picture.toImage(width.toInt(), height.toInt()),
      );
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RawImage?>(
      future: getSVG(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return SizedBox(
            width: width,
            height: height,
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

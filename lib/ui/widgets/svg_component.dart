import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGComponent extends StatelessWidget {
  const SVGComponent({
    required this.width,
    required this.height,
    super.key,
    this.rawSvg,
  });

  final String? rawSvg;
  final double width;
  final double height;

  Future<SvgPicture?> getSVG() async {
    try {
      final picture = SvgPicture.string(
        rawSvg!,
        width: width,
        height: height,
      );

      return picture;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SvgPicture?>(
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

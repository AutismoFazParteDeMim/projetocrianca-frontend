import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _SliderChild extends StatelessWidget {
  const _SliderChild({
    required this.title,
    required this.text,
    required this.image,
  });

  final String title;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Image(
            image: AssetImage(image),
          ),
        ),
        SizedBox(
          height: metrics.gap * 2,
        ),
        Text(
          title,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(
          height: metrics.gap / 2,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SliderComponent extends StatefulWidget {
  const SliderComponent({
    required this.data,
    super.key,
  });

  final List<Map<dynamic, dynamic>> data;

  @override
  State<StatefulWidget> createState() {
    return _SliderComponentState();
  }
}

class _SliderComponentState extends State<SliderComponent> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  late List<Map<dynamic, dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => setState(
                () {
                  _currentIndex = index;
                },
              ),
            ),
            items: data
                .map(
                  (e) => _SliderChild(
                    title: e['title'] as String,
                    text: e['text'] as String,
                    image: e['image'] as String,
                  ),
                )
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(top: 16, right: 10, bottom: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? colors.primary
                        : colors.secondary,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

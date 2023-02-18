import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _SliderChild extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const _SliderChild({
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(image)),
        Text(
          title,
          style: theme.textTheme.titleMedium,
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
  final List<Map> data;

  const SliderComponent({
    super.key,
    required this.data,
  });

  @override
  State<StatefulWidget> createState() {
    return _SliderComponentState();
  }
}

class _SliderComponentState extends State<SliderComponent> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  late List<Map> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
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
            initialPage: 0,
            onPageChanged: (index, reason) => setState(
              () {
                _currentIndex = index;
              },
            ),
          ),
          items: data
              .map((e) => _SliderChild(
                  title: e["title"], text: e["text"], image: e["image"]))
              .toList(),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
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

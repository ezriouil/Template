import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCarouselProductImages extends Responsive {
  final CarouselController controller;
  final List<String> images;
  final Function(int, dynamic) onPageChange;
  final int currentIndex;
  final Color? indicatorColor;
  final double? sizeWidth, sizeHeight, viewportFraction;
  final IndicatorEffect? effect;

  const CustomCarouselProductImages(
      {super.key,
      required this.controller,
      required this.images,
        this.sizeWidth,
        this.viewportFraction,
        this.effect,
        this.indicatorColor,
        this.sizeHeight,
      required this.onPageChange,
      required this.currentIndex});

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: sizeWidth ?? getWidth(context),
      height: sizeHeight ?? getWidth(context),
      alignment: Alignment.center,
      child: Stack(children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: getWidth(context),
            aspectRatio: 16 / 9,
            viewportFraction: viewportFraction ?? 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            onPageChanged: onPageChange,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              CustomImageNetwork(
                  src: images[index],
                  height: getWidth(context),
                  width: getWidth(context)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              count: images.length,
              effect: effect ?? ExpandingDotsEffect(
                  dotHeight: 4.0,
                  dotColor: indicatorColor?.withOpacity(0.4) ??CustomColors.BLACK.withOpacity(0.4),
                  activeDotColor: indicatorColor ??CustomColors.BLACK),
              activeIndex: currentIndex,
            ),
          ),
        ),
      ]),
    );
  }
}
